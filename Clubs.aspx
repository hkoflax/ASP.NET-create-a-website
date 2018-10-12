<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Clubs.aspx.cs" Inherits="Clubs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Clubs
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <br />
    <h1>List of clubs</h1>
    <div class="DisplayClubs">
        <asp:GridView ID="ClubView" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="ClubView_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">

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
                <asp:BoundField HeaderText="Club Id" DataField="RegNum" />
                <asp:ButtonField HeaderText="Club Name" CommandName="Select" Text="Select" DataTextField="ClubName" />
            </Columns> 
        </asp:GridView>
    </div>
    <h1><a href="TransferWindow.aspx#Body">Transfer Window</a></h1>
    <br />
</asp:Content>

