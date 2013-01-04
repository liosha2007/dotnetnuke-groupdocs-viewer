/*
' Copyright (c) 2012  Groupdocs
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using System.Web.UI.WebControls;
using Groupdocs.Sdk;
using Groupdocs.Api.Contract;


namespace DotNetNuke.Modules.EmbedViewer
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Settings class manages Module Settings
    /// 
    /// Typically your settings control would be used to manage settings for your module.
    /// There are two types of settings, ModuleSettings, and TabModuleSettings.
    /// 
    /// ModuleSettings apply to all "copies" of a module on a site, no matter which page the module is on. 
    /// 
    /// TabModuleSettings apply only to the current module on the current page, if you copy that module to
    /// another page the settings are not transferred.
    /// 
    /// If you happen to save both TabModuleSettings and ModuleSettings, TabModuleSettings overrides ModuleSettings.
    /// 
    /// Below we have some examples of how to access these settings but you will need to uncomment to use.
    /// 
    /// Because the control inherits from EmbedViewerSettingsBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Settings : EmbedViewerSettingsBase
    {
        private const string SERVICE_URL = "https://api.groupdocs.com/v2.0";

        #region Base Method Implementations

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// LoadSettings loads the settings from the Database and displays them
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void LoadSettings()
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    //Check for existing settings and use those on this page
                    //Settings["SettingName"]

                    if (Settings.Contains("GUID"))
                        txtGuid.Text = Settings["GUID"].ToString();

                    if (Settings.Contains("FrameWidth"))
                        txtFrameWidth.Text = Settings["FrameWidth"].ToString();

                    if (Settings.Contains("FrameHeight"))
                        txtFrameHeight.Text = Settings["FrameHeight"].ToString();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// UpdateSettings saves the modified settings to the Database
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void UpdateSettings()
        {
            try
            {
                ModuleController modules = new ModuleController();

                //the following are two sample Module Settings, using the text boxes that are commented out in the ASCX file.
                //module settings
                modules.UpdateModuleSetting(ModuleId, "GUID", txtGuid.Text);
                modules.UpdateModuleSetting(ModuleId, "FrameWidth", txtFrameWidth.Text);
                modules.UpdateModuleSetting(ModuleId, "FrameHeight", txtFrameHeight.Text);

                //tab module settings
                //modules.UpdateTabModuleSetting(TabModuleId, "Setting1",  txtSetting1.Text);
                //modules.UpdateTabModuleSetting(TabModuleId, "Setting2",  txtSetting2.Text);
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// <summary>
        /// Load files button click
        /// </summary>
        /// <param name="sender">button object</param>
        /// <param name="e">event object</param>
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtClientid.Text) && !string.IsNullOrEmpty(txtPrivatekey.Text))
            {
                lblErrmsg.Visible = false;

                trwFiles.Nodes.Clear();

                GroupdocsService service = new GroupdocsService(SERVICE_URL, txtClientid.Text, txtPrivatekey.Text);

                fillTreeView(service, "/", trwFiles.Nodes);

                
            }
            else
            {
                lblErrmsg.Visible = true;
            }
        }

        private void fillTreeView(GroupdocsService service, string path, TreeNodeCollection nodes)
        {

            ListEntitiesResult res = service.GetFileSystemEntities(path, 0, -1, null, true, null, null);

            if (res.Count > 0 && res.Files != null && res.Folders != null)
            {
                for (int index = 0; index < res.Folders.Length; index++)
                {
                    FileSystemFolder folder = res.Folders[index];
                    TreeNode treeNode = new TreeNode(folder.Name);
                    treeNode.Value = "";
                    nodes.Add(treeNode);
                    fillTreeView(service, path + folder.Name + "/", treeNode.ChildNodes);
                }
                for (int index = 0; index < res.Files.Length; index++)
                {
                    FileSystemDocument document = res.Files[index];
                    TreeNode treeNode = new TreeNode(document.Name, document.Guid);
                    nodes.Add(treeNode);
                }
            }
        }

        /// <summary>
        /// Tree view node selected
        /// </summary>
        /// <param name="sender">tree view object</param>
        /// <param name="e">event object</param>
        protected void trwFiles_SelectedNodeChanged(object sender, EventArgs e)
        {
            TreeNode treeNode = trwFiles.SelectedNode;
            trwFiles.CollapseAll();
            if (treeNode.Value != "")
            {
                txtGuid.Text = treeNode.Value;
                showNode(treeNode);
            }
            else
            {
                txtGuid.Text = "";
            }
        }

        private void showNode(TreeNode treeNode)
        {
            treeNode.Select();
            while (treeNode.Parent != null)
            {
                treeNode = treeNode.Parent;
                treeNode.Expand();
            }
        }

        #endregion
    }

}

