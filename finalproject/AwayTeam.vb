''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' AwayTeam.vb controls/contains the data and actions for the Away Team
''' 
''' Created by: Ethan Clark for CS 214 Final Project
''' Date: Spring 2016

Public Class AwayTeam

    ' Declare the variables/players that are on the away team
    Dim Away_Pitcher As New Player_Information
    Dim Away_Catcher As New Player_Information
    Dim Away_First As New Player_Information
    Dim Away_Second As New Player_Information
    Dim Away_Third As New Player_Information
    Dim Away_Short As New Player_Information
    Dim Away_Left As New Player_Information
    Dim Away_Center As New Player_Information
    Dim Away_Right As New Player_Information

    Public roster(8) As Player_Information

    ' Subprogram to put all the players into one array for ease of access
    Public Sub Make_Roster()
        roster(0) = Away_Pitcher
        roster(1) = Away_Catcher
        roster(2) = Away_First
        roster(3) = Away_Second
        roster(4) = Away_Third
        roster(5) = Away_Short
        roster(6) = Away_Left
        roster(7) = Away_Center
        roster(8) = Away_Right
    End Sub

End Class
