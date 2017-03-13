''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' HomeTeam.vb controls/contains the data and actions involved with the Home Team
''' 
''' Created by: Ethan Clark for CS 214 Final Project
''' Date: Spring 2016

Public Class HomeTeam

    ' Declare the variables/players for the home team
    Dim Home_Pitcher As New Player_Information
    Dim Home_Catcher As New Player_Information
    Dim Home_First As New Player_Information
    Dim Home_Second As New Player_Information
    Dim Home_Third As New Player_Information
    Dim Home_Short As New Player_Information
    Dim Home_Left As New Player_Information
    Dim Home_Center As New Player_Information
    Dim Home_Right As New Player_Information

    Public roster(8) As Player_Information

    ' Subprogram to put all the players into one array for ease of access
    Public Sub Make_Roster()
        roster(0) = Home_Pitcher
        roster(1) = Home_Catcher
        roster(2) = Home_First
        roster(3) = Home_Second
        roster(4) = Home_Third
        roster(5) = Home_Short
        roster(6) = Home_Left
        roster(7) = Home_Center
        roster(8) = Home_Right
    End Sub

End Class
