<%@ Page Title="Редактировать статью" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="NewsSite.Admin.Articles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView runat="server" ID="ListViewArticles" ItemType="NewsSite.Models.Article" DataKeyNames="ID" SelectMethod="ListViewArticles_GetData" InsertMethod="ListViewArticles_InsertItem" UpdateMethod="ListViewArticles_UpdateItem" DeleteMethod="ListViewArticles_DeleteItem" InsertItemPosition="LastItem" OnSorting="ListViewArticles_Sorting">
        <LayoutTemplate>
            <div class="row">
                <asp:LinkButton runat="server" ID="ButtonSortByTitle" CssClass="col-md-2 btn btn-default" Text="Сортировать по заголовку" CommandArgument="Title" CommandName="Sort" />
                <asp:LinkButton runat="server" ID="ButtonSortByDate" CssClass="col-md-2 btn btn-default" Text="Сортировать по дате" CommandArgument="DateCreated" CommandName="Sort" />
                <asp:LinkButton runat="server" ID="ButtonSortByCategory" CssClass="col-md-2 btn btn-default" Text="Сортировать по категориям" CommandArgument="Category.Name" CommandName="Sort" />
                <asp:LinkButton runat="server" ID="ButtonSortByLikes" CssClass="col-md-2 btn btn-default" Text="Сортировать по лайкам" CommandArgument="Likes.Count" CommandName="Sort" />
            </div>
            <div runat="server" id="itemPlaceHolder"></div>
            <div class="row">
                <asp:DataPager runat="server" ID="DataPagerArticles" PagedControlID="ListViewArticles" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ShowNextPageButton="false" ShowPreviousPageButton="true" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ShowNextPageButton="true" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="row">
                <h3><%#: Item.Title %>
                    <asp:LinkButton runat="server" ID="ButtonEditArticle" CssClass="btn btn-info " Text="Редактировать" CommandName="Edit" />
                    <asp:LinkButton runat="server" ID="ButtonDeleteArticle" CssClass="btn btn-danger" Text="Удалить" CommandName="Delete" />
                </h3>
                <p>Category: <%#: Item.Category.Name %></p>
                <p>
                    <%#: Item.Content.Length > 300 ? Item.Content.Substring(0, 300) + "..." : Item.Content  %>
                </p>
                <p>Likes count: <%#: Item.Likes.Count %></p>
                <div>
                    <i>by <%#: Item.Author.UserName ?? "" %></i>
                    <i>created on: <%# Item.DateCreated %></i>
                </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="row">
                <h3>
                    <asp:TextBox runat="server" ID="TextBoxEditTitle" Text="<%# BindItem.Title %>" />
                    <asp:RequiredFieldValidator ErrorMessage="Title is required" ValidationGroup="EditArticle" ControlToValidate="TextBoxEditTitle" ForeColor="Red" runat="server" />
                    <asp:LinkButton runat="server" ID="ButtonEditArticle" CssClass="btn btn-success" Text="Сохранить" CommandName="Update" CausesValidation="true" ValidationGroup="EditArticle" />
                    <asp:LinkButton runat="server" ID="ButtonDeleteArticle" CssClass="btn btn-danger" Text="Отменить" CommandName="Cancel" CausesValidation="false" />
                </h3>
                <p>
                    <asp:DropDownList runat="server" ID="DropDownListCategories"
                        SelectedValue="<%#: BindItem.CategoryID %>" DataTextField="Name" DataValueField="ID" SelectMethod="DropDownListCategories_GetData" />
                <p>
                    <asp:TextBox runat="server" ID="TextBoxEditContent" Text="<%# BindItem.Content %>" TextMode="MultiLine" Rows="6" Width="100%" /><asp:RequiredFieldValidator ErrorMessage="Content is required" ValidationGroup="EditArticle" ControlToValidate="TextBoxEditContent" ForeColor="Red" runat="server" />
                </p>
                <div>
                    <i>автор <%#: this.User.Identity.GetUserName() %></i>
                    <i>дата: <%# Item.DateCreated %></i>
                </div>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <a href="#" id="buttonShowInsertPanel" class="btn btn-info pull-right" onclick="(function (ev) { $('#panelInsertArticle').show(); $('#buttonShowInsertPanel').hide(); }())">Insert new Article</a>
            <div id="panelInsertArticle" style="display: none;">

                <div class="row">
                    <h3>Заголовок: 
                    <asp:TextBox runat="server" ID="TextBoxInsertTitle" Width="300" Text="<%#: BindItem.Title %>"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Title is required!" ValidationGroup="InsertArticle" ControlToValidate="TextBoxInsertTitle" ForeColor="Red" runat="server" />
                    </h3>
                    <p>
                        Категория: 
                    <asp:DropDownList runat="server" ID="DropDownListCategories" ItemType="NewsSite.Models.Category" DataTextField="Name" SelectedValue="<%#: BindItem.CategoryID %>" DataValueField="ID" SelectMethod="DropDownListCategories_GetData">
                    </asp:DropDownList>
                    </p>
                    <p>
                        Содержание: 
                    <asp:TextBox runat="server" ID="TextBoxInsertContent" Width="300" TextMode="MultiLine" Text="<%#: BindItem.Content %>" Rows="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Content is Required!" ValidationGroup="InsertArticle" ControlToValidate="TextBoxInsertContent" ForeColor="Red" runat="server" />
                    </p>
                    <div>
                        <asp:LinkButton runat="server" ID="ButtonInsertArticle" CssClass="btn btn-success" CommandName="Insert" Text="Вставить" CausesValidation="true" ValidationGroup="InsertArticle" />
                        <asp:LinkButton runat="server" ID="LinkButton1" CssClass="btn btn-danger" CommandName="Cancel" Text="Отменить" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </asp:ListView>

</asp:Content>
