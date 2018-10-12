<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MyControl.ascx.cs" Inherits="MyControl" %>
<asp:Table ID="Table1" runat="server">
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Right"  Width="250px">
            <asp:RequiredFieldValidator ID="validClubName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName" runat="server" ErrorMessage="Please Enter a valid Club name !" ValidationGroup="addclub">
                *
            </asp:RequiredFieldValidator>
            <asp:Label ID="lblName" runat="server" Text="Name :"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Right" Width="250px">
            <asp:RequiredFieldValidator ID="validClubCity" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtCity" runat="server" ErrorMessage="Please Enter a valid Club city !" ValidationGroup="addclub">
                *
            </asp:RequiredFieldValidator>
            <asp:Label ID="lblCity" runat="server" Text="City :"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

