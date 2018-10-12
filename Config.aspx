<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Config.aspx.cs" Inherits="Config" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Config
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <h1>Pick a theme</h1>
    <div class="config">
        <asp:Table ID="Table1" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>
                    <asp:Label ID="lblTheme" runat="server" Text="Themes"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <asp:DropDownList ID="ThemeList" runat="server">
                        <asp:ListItem>Light</asp:ListItem>
                        <asp:ListItem>Dark</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>

