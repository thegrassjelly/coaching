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

        <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-5">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>

                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>
                
                <a href='<%= Page.ResolveUrl("~/Users/AddBC.aspx") %>' style="color: white">
                <h2><i class="fa fa-list"></i> Add Body Comp</h2>
                </a>

                <div class="chart-wrapper px-0" style="height: 70px;" height="70">
                    <canvas id="widgetChart1"></canvas>
                </div>

            </div>

        </div>
    </div>
    <!--/.col-->

    <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-5">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>
                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>

                <a href='<%= Page.ResolveUrl("~/Progress/View.aspx") %>' style="color: white">
                <h2><i class="fa fa-list"></i> Progress Gallery</h2>
                </a>

                <div class="chart-wrapper px-0" style="height: 70px;" height="70">
                    <canvas id="widgetChart2"></canvas>
                </div>

            </div>
        </div>
    </div>
    <!--/.col-->

    <div class="col-sm-6 col-lg-3">
        <div class="card text-white bg-flat-color-5">
            <div class="card-body pb-0">
                <div class="dropdown float-right">
                    <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </button>
                </div>
                <h4 class="mb-0">
                    <span class="count">10468</span>
                </h4>
                
                <a href='<%= Page.ResolveUrl("~/Schedule/View.aspx") %>' style="color: white">
                <h2><i class="fa fa-list"></i> View Schedule</h2>
                </a>

            </div>

            <div class="chart-wrapper px-0" style="height: 70px;" height="70">
                <canvas id="widgetChart"></canvas>
            </div>
        </div>
    </div>
    <!--/.col-->
</asp:Content>

