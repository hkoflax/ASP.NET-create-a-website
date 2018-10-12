<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransferWindow.aspx.cs" Inherits="TransferWindow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <a name="Body">
        <h1>Transfer List</h1>
        <div class="DisplayClubs">
            <asp:GridView ID="ClubView" runat="server" AutoGenerateColumns="False" OnRowUpdating="ClubView_RowUpdating" AllowSorting="false" OnSorting="ClubView_Sorting" OnRowCancelingEdit="ClubView_RowCancelingEdit" OnRowEditing="ClubView_RowEditing" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    <asp:TemplateField HeaderText="Player Name" SortExpression="PlayerName">
                        <ItemTemplate>
                            <asp:Label ID="PlayerLbl" runat="server" Text='<%#Bind("PlayerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actual Club" SortExpression="ClubName">
                        <ItemTemplate>
                            <asp:Label ID="ClubLbl" runat="server" Text='<%#Bind("ClubName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transfer Club">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ClubList" runat="server"
                                DataSourceID="ClubListSource"
                                DataTextField="ClubName" DataValueField="RegNum"
                                Width="270">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="NewClubLbl" runat="server" Text='<%#Bind("ClubName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="SaveTransferBtn" runat="server" Text="Complete All Transfer" OnClick="SaveTransferBtn_Click" />
            <asp:Button ID="BackBtn" runat="server" Text="Back" OnClick="BackBtn_Click" />
            <br />
            <br />
            <asp:SqlDataSource ID="ClubListSource" runat="server" ConnectionString="<%$ ConnectionStrings:Assignment3 %>" SelectCommand="SELECT [RegNum], [ClubName] FROM [Clubs]"></asp:SqlDataSource>
        </div>
    </a>
</asp:Content>

