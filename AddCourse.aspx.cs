using AlgonquinCollege.Registration.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_3
{
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton btnHome = (LinkButton)Master.FindControl("btnHome"); //instanciating Home button
            btnHome.Click += (s, a) => Response.Redirect("Default.aspx"); //adding action to Home Button

            BulletedList topMenu = (BulletedList)Master.FindControl("topMenu"); //instanciationg Top Menu
            if (!IsPostBack)
            {
                topMenu.Items.Add(new ListItem("Add Student Records")); //adding buttons to Top Menu

                if (Session["courseListSession"] == null)
                {
                    TableRow lastRow = new TableRow();
                    TableCell lastRowCell = new TableCell();
                    lastRowCell.Text = "No student record exist!";
                    lastRowCell.ForeColor = System.Drawing.Color.Red;
                    lastRowCell.ColumnSpan = 3;
                    lastRowCell.HorizontalAlign = HorizontalAlign.Center;
                    lastRow.Cells.Add(lastRowCell);
                    tableSort.Rows.Add(lastRow);
                }
                else //displaying table with list of courses
                {
                    List<Course> courseList;
                    courseList = (List<Course>)Session["courseListSession"];

                    //retrieving values for Reverse variables to be used in sort query:
                    bool reverseCode = false;
                    if ((Session["reverseCode"] != null))
                    {
                        reverseCode = (bool)Session["reverseCode"];
                    }
                    bool reverseTitle = false;
                    if ((Session["reverseTitle"] != null))
                    {
                        reverseTitle = (bool)Session["reverseTitle"];
                    }

                    //creating queries for sorting
                    string sort = Request.Params["sort"];
                    if (!String.IsNullOrEmpty(sort))
                    {
                        if (Request.Params["sort"] == "code") //if sorted by code
                        {
                            if (reverseCode == false) //ascending order
                            {
                                courseList.Sort((p1, p2) => string.Compare(p1.CourseNumber, p2.CourseNumber, true));
                                ShowStudentRecords();
                                reverseCode = true;
                                Session["reverseCode"] = reverseCode;
                            }
                            else //descending order
                            {
                                courseList.Sort((p1, p2) => string.Compare(p1.CourseNumber, p2.CourseNumber, true));
                                courseList.Reverse();
                                ShowStudentRecords();
                                reverseCode = false;
                                Session["reverseCode"] = reverseCode;
                            }
                        }
                        else if (Request.Params["sort"] == "title") //if sorted by title
                        {
                            if (reverseTitle == false) //ascending order
                            {
                                courseList.Sort((p1, p2) => string.Compare(p1.CourseName, p2.CourseName, true));
                                ShowStudentRecords();
                                reverseTitle = true;
                                Session["reverseTitle"] = reverseTitle;
                            }
                            else //descending order
                            {
                                courseList.Sort((p1, p2) => string.Compare(p1.CourseName, p2.CourseName, true));
                                courseList.Reverse();
                                ShowStudentRecords();
                                reverseTitle = false;
                                Session["reverseTitle"] = reverseTitle;
                            }
                        }
                    }
                    else
                    {
                        courseList.Sort((p1, p2) => string.Compare(p1.CourseName, p2.CourseName, true));
                        ShowStudentRecords();
                        reverseTitle = true;
                        Session["reverseTitle"] = reverseTitle;
                    }
                }
            }
            topMenu.Click += (s, a) => Response.Redirect("AddStudent.aspx"); //adding action to Add Student Button
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            //creating course
            string courseCode = txtCourseNumber.Text;
            string courseTitle = txtCourseName.Text;
            Course newCourse = new Course(courseCode, courseTitle);
            List<Course> courseList = new List<Course>();

            //adding course to list and session
            if (Session["courseListSession"] == null)
            {
                courseList.Add(newCourse);
                Session["courseListSession"] = courseList;
            }
            else
            {
                courseList = (List<Course>)Session["courseListSession"];
                courseList.Add(newCourse);
                Session["courseListSession"] = courseList;
            }

            //displaying updated table from course list
            ShowStudentRecords();
            txtCourseNumber.Text = "";
            txtCourseName.Text = "";
        }

        private void ShowStudentRecords()
        {
            List<Course> courseList = new List<Course>();
            courseList = (List<Course>)Session["courseListSession"];

            //displaying updated table from course list
            foreach (Course item in courseList)
            {
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.Text = item.CourseNumber.ToString();
                row.Cells.Add(cell);
                cell = new TableCell();
                cell.Text = item.CourseName.ToString();
                row.Cells.Add(cell);
                tableSort.Rows.Add(row);
            }
        }
    }
}