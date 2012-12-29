<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.EmbedViewer.Settings" Codebehind="Settings.ascx.cs" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>


<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
<fieldset>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $('#guidTab').click(function () {
                $('#browseBlock').hide();
                $('#guidBlock').show();
                $('#browseTab').removeClass("ui-tabs-selected ui-state-active");
                $('#guidTab').addClass("ui-tabs-selected ui-state-active");
                return false;
            });
            $('#browseTab').click(function () {
                $('#guidBlock').hide();
                $('#browseBlock').show();
                $('#guidTab').removeClass("ui-tabs-selected ui-state-active");
                $('#browseTab').addClass("ui-tabs-selected ui-state-active");
                return false;
            });
        });
    </script>
    <div>
        <div>
        </div>
        <div class="dnnFormItem">
            <ul class="dnnAdminTabNav dnnClear ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">

                <li id="guidTab" class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active">
                    <a href="#guidBlock">File GUID</a>
                </li>
                <li id="browseTab" class="ui-state-default ui-corner-top">
                    <a href="#browseBlock">File Browse</a>
                </li>
            </ul>
            <div id="guidBlock">
                <dnn:Label ID="lblGuid" Text="GUID" runat="server" /> 
                <asp:TextBox ID="txtGuid" runat="server" />
            </div>
            <div id="browseBlock" style="display: none;">
                <div>
                    <dnn:label ID="lblClientid" Text="Client ID" runat="server" />
                    <asp:TextBox ID="txtClientid" runat="server" />
                </div>
                <div>
                    <dnn:label ID="lblPrivatekey" Text="Private Key" runat="server" />
                    <asp:TextBox ID="txtPrivatekey" runat="server" />
                </div>
            </div>
        </div>
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
