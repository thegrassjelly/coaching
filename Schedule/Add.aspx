<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Schedule_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Add Schedule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <strong>Client Details</strong>
                </div>
                <div class="card-body card-block">
                    <div class="col-lg-6">
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Schedule Subject</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtSubject" class="form-control" 
                                             Placeholder="Subject" runat="server" required />
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Training Start</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtStime" class="form-control" 
                                             TextMode="DateTimeLocal" runat="server" required />
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Training End</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtETime" class="form-control" 
                                             TextMode="DateTimeLocal" runat="server" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Other Details</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtDesc" class="form-control" 
                                             Placeholder="Other Details" 
                                             TextMode="Multiline" Style="max-width: 100%" 
                                             runat="server" required />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="pull-right">
                        <asp:Button ID="btnSubmit" class="btn btn-primary" 
                                    runat="server" Text="Add Schedule" OnClick="btnSubmit_OnClick" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

