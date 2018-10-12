<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlayerDetails.aspx.cs" Inherits="PlayerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Player Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <br />
    <h1>Details</h1>
    <div class="Details Clubs">
        <asp:DetailsView ID="DetailsView" runat="server" AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" OnItemUpdating="DetailsView_ItemUpdating" OnModeChanging="DetailsView_ModeChanging" OnItemDeleting="DetailsView_ItemDeleting" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="NameTxt" runat="server" Text='<%# Bind("Playername") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="NameLbl" runat="server" Text='<%# Bind("Playername") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Jersey Number">
                    <EditItemTemplate>
                        <asp:TextBox ID="JerseyTxt" runat="server" Text='<%# Bind("JerseyNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="JerseyLbl" runat="server" Text='<%# Bind("JerseyNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DOB">
                    <EditItemTemplate>
                        <asp:TextBox ID="DobTxt" runat="server" Text='<%# Bind("DOB","{0:d}") %>' TextMode="Date" Width="297" Font-Size="X-Large" Font-Bold="True"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DobLbl" runat="server" Text='<%# Bind("DOB","{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Club">
                    <ItemTemplate>
                        <asp:Label ID="clubLbl" runat="server" Text='<%# Bind("ClubName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
            </Fields>
            <HeaderTemplate>
                <%#Eval("PlayerName")%>
            </HeaderTemplate>
        </asp:DetailsView>
        <br />
        <h1><a href="ClubDetails.aspx#Body">Back to Players</a></h1>
    </div>
</asp:Content>

