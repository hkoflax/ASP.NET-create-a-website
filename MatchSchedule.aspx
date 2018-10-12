<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MatchSchedule.aspx.cs" Inherits="MatchSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Match Schedule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <h1>Matchs</h1>
    <div class="">
        <asp:Table ID="ScheduleTable" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>HOST</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>GUEST</asp:TableHeaderCell>
                <asp:TableHeaderCell>MATCH DATE</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:DropDownList ID="HomeClubList" runat="server" OnSelectedIndexChanged="HomeClubList_SelectedIndexChanged"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>VS</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="AwayClubList" runat="server" OnSelectedIndexChanged="AwayClubList_SelectedIndexChanged"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtmatchDate" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnSchedule" runat="server" Text="Schedule" OnClick="Button1_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <h1>List Of Matches</h1>
        <div>
            <asp:GridView ID="SchduleView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:BoundField HeaderText="Match" DataField="MatchId" />
                    <asp:BoundField HeaderText="Home Team" DataField="HomeTeam" />
                    <asp:BoundField HeaderText="Away Team" DataField="AwayTeam" />
                    <asp:BoundField HeaderText="Match Date" DataField="MatchDate" DataFormatString="{0:yyy-MM-dd}" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
    <br />
</asp:Content>

