<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClubDetails.aspx.cs" Inherits="ClubDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Club Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <a name="Body">
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
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="IdLbl" runat="server" Text='<%# Bind("RegNum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="NameTxt" runat="server" Text='<%# Bind("ClubName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="NameLbl" runat="server" Text='<%# Bind("ClubName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="CityTxt" runat="server" Text='<%# Bind("ClubCity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CityLbl" runat="server" Text='<%# Bind("ClubCity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Adress">
                        <EditItemTemplate>
                            <asp:TextBox ID="AdressTxt" runat="server" Text='<%# Bind("Adress") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AdressLbl" runat="server" Text='<%# Bind("Adress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                </Fields>
                <HeaderTemplate>
                    <%#Eval("ClubName")%>
                </HeaderTemplate>
            </asp:DetailsView>
            <br />
            <h1>List of Players</h1>
            <asp:GridView ID="PlayerList" AutoGenerateColumns="False" OnSelectedIndexChanged="PlayerList_SelectedIndexChanged" runat="server">
                <AlternatingRowStyle BackColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

                <Columns>
                    <asp:ButtonField HeaderText="Name" CommandName="Select" Text="Select" DataTextField="PlayerName" />
                    <asp:BoundField HeaderText="Jersey" DataField="JerseyNumber" />
                </Columns>
            </asp:GridView>
            <h1><a href="Clubs.aspx">Back to Clubs</a></h1>
        </div>
    </a>
</asp:Content>

