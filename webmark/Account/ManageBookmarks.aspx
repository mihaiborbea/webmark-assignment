﻿<%@ Page Title="Manage Bookmarks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="webmark.Account.ManageBookmarks" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            Name:
            <asp:HyperLink NavigateUrl='<%# Eval("Id", "~/ViewBookmark.aspx?id={0}")  %>' ID="ViewBookmrk" runat="server">
                <asp:Label ID="wTitle" runat="server" Text='<%# Eval("Title") %>' />&nbsp;
            </asp:HyperLink>
            <br />
            Email:
            <asp:Label ID="Description" runat="server" Text='<%# Eval("Description") %>' />
            <asp:Button ID="DeleteBookmark" runat="server" Text="Delete" CssClass="btn btn-xs btn-danger" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteBookmark_Clicked" /><br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Title], [Description], [URL], [Tag1], [Tag2], [Tag3], [Votes], [CreationDate] FROM [Bookmarks]"></asp:SqlDataSource>

</asp:Content>
