<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.EmbedViewer.Settings" Codebehind="Settings.ascx.cs" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>
<script runat="server">

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (!"".Equals(txtClientid.Text) && !"".Equals(txtPrivatekey.Text))
        {
            trwFiles.Nodes.Add(new TreeNode("1223"));
        }
    }
</script>
<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
<fieldset>
    <div class="dnnFormItem">
        <dnn:label ID="lblClientid" Text="Client ID" runat="server" />
        <asp:TextBox ID="txtClientid" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="lblPrivatekey" Text="Private Key" runat="server" />
        <asp:TextBox ID="txtPrivatekey" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="Label1" Text="" runat="server" />
        <asp:Button ID="btnUpdate" Text="Load files" runat="server" 
             Width="200" onclick="btnUpdate_Click" />
    </div>
    <div class="dnnFormItem" align="right">
        <dnn:label ID="Label2" Text="" runat="server" />
        <div style="display: inline-block;">
            <asp:TreeView ID="trwFiles" ShowLines="true" runat="server" ForeColor="#660033" 
                BorderWidth="1" Height="200px" Width="435px" BorderColor="#C9C9C9" />
        </div>
    </div>
    <div class="dnnFormItem" style="margin-top: 20px;">
        <dnn:Label ID="lblGuid" Text="GUID" runat="server" /> 
        <asp:TextBox ID="txtGuid" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="lblFrameWidth" Text="Image Width" runat="server" />
        <asp:TextBox ID="txtFrameWidth" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="lblFrameHeight" Text="Image Height" runat="server" />
        <asp:TextBox ID="txtFrameHeight" runat="server" />
    </div>

</fieldset>
