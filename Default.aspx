<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-1">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>

                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>
                
                <a href='<%= Page.ResolveUrl("~/Users/Add.aspx") %>' style="color: white">
                <h2><i class="fa fa-plus"></i> Add Clients</h2>
                </a>

                <div class="chart-wrapper px-0" style="height: 70px;" height="70">
                    <canvas id="widgetChart1"></canvas>
                </div>

            </div>

        </div>
    </div>
    <!--/.col-->

    <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-2">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>
                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>

                <a href='<%= Page.ResolveUrl("~/Users/View.aspx") %>' style="color: white">
                <h2><i class="fa fa-list"></i> View Clients</h2>
                </a>

                <div class="chart-wrapper px-0" style="height: 70px;" height="70">
                    <canvas id="widgetChart2"></canvas>
                </div>

            </div>
        </div>
    </div>
    <!--/.col-->

    <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-3">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>
                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>
                
                <a href='<%= Page.ResolveUrl("~/Coaching/Add.aspx") %>' style="color: white">
                <h2><i class="fa fa-plus"></i> Add Coaching</h2>
                </a>

            </div>

            <div class="chart-wrapper px-0" style="height: 70px;" height="70">
                <canvas id="widgetChart3"></canvas>
            </div>
        </div>
    </div>
    <!--/.col-->

    <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-4">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>
                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>

                <a href='<%= Page.ResolveUrl("~/Workout/AddWorkout.aspx") %>' style="color: white">
                    <h2><i class="fa fa-plus"></i> Add Workouts</h2>
                </a>

                <div class="chart-wrapper px-3" style="height: 70px;" height="70">
                    <canvas id="widgetChart4"></canvas>
                </div>

            </div>
        </div>
    </div>
    <!--/.col-->

    <div class="col-lg-3 col-md-6">
        <div class="social-box facebook">
            <i class="fa fa-facebook"></i>
            <ul>
                <li>
                    <strong><span class="count">40</span> k</strong>
                    <span>friends</span>
                </li>
                <li>
                    <strong><span class="count">450</span></strong>
                    <span>feeds</span>
                </li>
            </ul>
        </div>
        <!--/social-box-->
    </div>
    <!--/.col-->

    <div class="col-lg-3 col-md-6">
        <div class="social-box twitter">
            <i class="fa fa-twitter"></i>
            <ul>
                <li>
                    <strong><span class="count">30</span> k</strong>
                    <span>friends</span>
                </li>
                <li>
                    <strong><span class="count">450</span></strong>
                    <span>tweets</span>
                </li>
            </ul>
        </div>
        <!--/social-box-->
    </div>
    <!--/.col-->

    <div class="col-lg-3 col-md-6">
        <div class="social-box linkedin">
            <i class="fa fa-linkedin"></i>
            <ul>
                <li>
                    <strong><span class="count">40</span> +</strong>
                    <span>contacts</span>
                </li>
                <li>
                    <strong><span class="count">250</span></strong>
                    <span>feeds</span>
                </li>
            </ul>
        </div>
        <!--/social-box-->
    </div>
    <!--/.col-->

    <div class="col-lg-3 col-md-6">
        <div class="social-box google-plus">
            <i class="fa fa-google-plus"></i>
            <ul>
                <li>
                    <strong><span class="count">94</span> k</strong>
                    <span>followers</span>
                </li>
                <li>
                    <strong><span class="count">92</span></strong>
                    <span>circles</span>
                </li>
            </ul>
        </div>
        <!--/social-box-->
    </div>
    <!--/.col-->
</asp:Content>

