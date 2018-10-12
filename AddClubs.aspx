<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddClubs.aspx.cs" Inherits="AddClubs" %>

<%@ Register Src="~/MyControl.ascx" TagPrefix="uc1" TagName="MyControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Add Clubs
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="Server">
    <div>
        <br />
        <asp:Table  Width="1230px" class="Add" runat="server">
            <asp:TableRow>
                <asp:TableCell  Width="615px"><h1>ADD CLUB</h1> </asp:TableCell>
                <asp:TableCell  Width="615px"><h1>ADD Player</h1> </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:ValidationSummary ID="ValidationSummary1" Width="375px" ForeColor="Red" Font-Bold="true" DisplayMode="BulletList" HeaderText="Please fill the required field" runat="server" ValidationGroup="addclub" />
                    <uc1:MyControl runat="server" ID="MyClubControl" />
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right" Width="250px">
                                <asp:RequiredFieldValidator ID="validRegNum" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtRegNumber" runat="server" ErrorMessage="Please enter a valid registration number" ValidationGroup="addclub">
                        *
                                </asp:RequiredFieldValidator>
                                <asp:Label ID="lblRegNum" runat="server" Text="Reg Number :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtRegNumber" runat="server" TextMode="Number"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right" Width="250px">
                                <asp:Label ID="lblAdress" runat="server" Text="Adress :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right" Width="250px">
                                <asp:Button ID="btnCancelClub" runat="server" Text="Cancel Club" OnClick="btnCancelClub_Click" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnSaveClub" runat="server" Text="Save Club" OnClick="btnSaveClub_Click" ValidationGroup="addclub" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnAddPlayer" runat="server" Text="Add Player" Visible="False" OnClick="btnAddPlayer_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:ValidationSummary ID="ValidationSummary2" Width="375px" ForeColor="Red" Font-Bold="true" DisplayMode="BulletList" HeaderText="Please fill the required field" runat="server" ValidationGroup="addplayer" />
                    <asp:Table ID="Table2" runat="server" Visible="False">
                        <asp:TableRow>
                            <asp:TableCell Width="275px" HorizontalAlign="Right">
                                <asp:Label ID="lblPlayerName" runat="server" Text="Player Name :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TxtPname" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell  HorizontalAlign="Right">
                                <asp:Label ID="lblDOB" runat="server" Text="Date of Birth :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Text="1999-12-01"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell  HorizontalAlign="Right">
                                <asp:Label ID="lblJerseyNumber" runat="server" Text="Jersey Number :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtJersyeNum" runat="server" TextMode="Number"></asp:TextBox>
                                <asp:RangeValidator ID="validJerseyNum" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtJersyeNum" MinimumValue="0" MaximumValue="99" runat="server" ErrorMessage="Jersey # must be betwwen 0 and 99" Type="Integer" ValidationGroup="addplayer">
                        (0-99)
                                </asp:RangeValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell  HorizontalAlign="Right">
                                <asp:Label ID="LblClubName" runat="server" Text="Club Name :">
                                </asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ClubDropDownList" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell  HorizontalAlign="Right">
                                <asp:Button ID="btnCancelPlayer" runat="server" Text="Cancel Player" OnClick="btnCancelPlayer_Click" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnSavePlayer" runat="server" Text="Save Player"  ValidationGroup="addplayer" OnClick="btnSavePlayer_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
    </div>
</asp:Content>

