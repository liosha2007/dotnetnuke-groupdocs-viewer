<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.EmbedViewer.Settings" Codebehind="Settings.ascx.cs" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>


<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
<fieldset>
    <div class="dnnFormItem">
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
