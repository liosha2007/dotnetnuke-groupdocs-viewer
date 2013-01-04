<%@ Control Language="C#" AutoEventWireup="true" Inherits="DotNetNuke.Modules.EmbedViewer.Settings" CodeFile="Settings.ascx.cs" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>
<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
<script language="javascript" type="text/javascript">
    function enterFileIdCallback() {
        $('#selectFile').removeClass('ui-tabs-selected ui-state-active');
        $('#enterFileId').addClass('ui-tabs-selected ui-state-active');
        $('#selectFileBlock').hide();
        $('#enterGuidBlock').show();
    }
    function selectFileCallback() {
        $('#enterFileId').removeClass('ui-tabs-selected ui-state-active');
        $('#selectFile').addClass('ui-tabs-selected ui-state-active');
        $('#enterGuidBlock').hide();
        $('#selectFileBlock').show();
    }
</script>
<ul class="dnnAdminTabNav dnnClear ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
    <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active" onclick="selectFileCallback();" id="selectFile">
        <a href="javascript:void();">Select file</a>
    </li>
    <li class="ui-state-default ui-corner-top" onclick="enterFileIdCallback();" id="enterFileId">
        <a href="javascript:void();">Enter File ID</a>
    </li>
</ul>
<fieldset>
    <div id="selectFileBlock">
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
                onclick="btnUpdate_Click" Width="200px" />
        </div>
        <div class="dnnFormItem" style="color: Red; margin: 0px;">
            <dnn:label ID="Label3" Text="" runat="server" />
            <asp:Label ID="lblErrmsg" Text="Please, fill Client ID and Private Key before!" Visible="false" runat="server" />
        </div>
        <div class="dnnFormItem" style="margin-bottom: 20px;">
            <dnn:label ID="Label2" Text="" runat="server" />
            <div style="display: inline-block;">
                <asp:Panel runat="server" ScrollBars="Auto" BorderWidth="1" Height="200px" Width="435px" BorderColor="#C9C9C9">
                    <asp:TreeView ID="trwFiles" ShowLines="true" runat="server" ForeColor="#660033" 
                        BorderWidth="0" onselectednodechanged="trwFiles_SelectedNodeChanged">
                        <SelectedNodeStyle BackColor="#99CCFF" />
                    </asp:TreeView>
                </asp:Panel>
            </div>
        </div>
    </div>
    <div id="enterGuidBlock" style="display: none;">
        <div class="dnnFormItem">
            <dnn:Label ID="lblGuid" Text="GUID" runat="server" /> 
            <asp:TextBox ID="txtGuid" runat="server" />
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
