﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="GoldstoneForum.SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <asp:ListView ID="ListViewQuestions" runat="server"
        DataKeyNames="Id" ItemType="GoldstoneForum.Models.Question">
        <ItemTemplate>
            <div class="well well-sm">
                <div class="voting">
                    <div runat="server" class="question-votes-count"><span class="badge"><%# Item.Votes.Count %> votes</div>
                    <div runat="server" class="question-answers-count"><span class="badge"><%# Item.Answers.Count %> answers</div>
                </div>
                <div class="questionBox">
                    <asp:HyperLink runat="server" Font-Size="X-Large" Text="<%#: Item.Title %>" CssClass="question-title"
                        NavigateUrl='<%#"~/QuestionForm.aspx?id=" + Item.Id %>' />
                    <div runat="server" class="question-info">
                        Asked on <span runat="server" class="question-date"><%# Item.DatePosted.ToString() %></span>
                        in
                        <asp:HyperLink runat="server" CssClass="question-category"
                            NavigateUrl='<%#"Category.aspx?id=" + Item.Category.Id %>' Text="<%#: Item.Category.Name %>" />
                        by <span runat="server" class="question-author">
                            <%#: Item.User == null? "anonymous": Item.User.UserName %> </span>
                    </div>
                </div>
            </div>
        </ItemTemplate>
     <EmptyDataTemplate>
         <asp:Literal Text="No results found!" runat="server" />
     </EmptyDataTemplate>
    </asp:ListView>

</asp:Content>
