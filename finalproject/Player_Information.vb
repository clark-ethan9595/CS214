''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' Player_Information.vb controls/contains the data/statistics for each Player Type
''' 
''' Created by: Ethan Clark for CS 214 Final Project
''' Date: Spring 2016

Public Class Player_Information

    ' Declare instance data variable for all Players
    Dim name As String
    Dim position As String
    Dim At_Bats As Integer = 0
    Dim Hits As Integer = 0
    Dim Runs_Batted_In As Integer = 0
    Dim Runs_Scored As Integer = 0
    Dim Home_Runs As Integer = 0
    Dim Doubles As Integer = 0
    Dim Triples As Integer = 0
    Dim Walks_Batting As Integer = 0
    Dim StrikeOuts As Integer = 0
    Dim Steals As Integer = 0
    Dim Errors As Integer = 0
    Dim Batting_Average As Double = 0.0

    ' Declare instance data variables for Pitcher Players
    Dim Total_Pitches As Integer = 0
    Dim Strikes As Integer = 0
    Dim Balls As Integer = 0
    Dim Walks_Pitched As Integer = 0
    Dim Strikeouts_Thrown As Integer = 0
    Dim Runs_Given As Integer = 0
    Dim Hits_Given As Integer = 0

    ''' Accessor method for the Player_Information String name
    Public Function Get_Name()
        Return name
    End Function

    ''' Accessor method for the Player_Information String position
    Public Function Get_Position()
        Return position
    End Function

    ''' Accessor method for the Player_Information Total_Pitches count
    Public Function Get_Pitch_Count()
        Return Total_Pitches.ToString
    End Function

    ''' Accessor method for the Player_Information Strikes count
    Public Function Get_Strikes()
        Return Strikes.ToString
    End Function

    ''' Accessor method for the Player_Information Balls count
    Public Function Get_Balls()
        Return Balls.ToString
    End Function

    ''' Accessor method for the Player_Information Walks_Pitched count
    Public Function Get_Walks_Thrown()
        Return Walks_Pitched.ToString
    End Function

    ''' Accessor method for the Player_Information Strikeouts_Thrown count
    Public Function Get_Strikeouts_Thrown()
        Return Strikeouts_Thrown.ToString
    End Function

    ''' Accessor method for the Player_Information Earned_Runs count
    Public Function Get_RunsGiven()
        Return Runs_Given.ToString
    End Function

    ''' Accessor method for the Player_Information Hits_Given count
    Public Function Get_Hits_Given()
        Return Hits_Given.ToString
    End Function

    ''' Accessor method for the Player_Information At_Bats count
    Public Function Get_At_Bats()
        Return At_Bats.ToString
    End Function
    ''' Accessor method for the Player_Information Hits count
    Public Function Get_Hits()
        Return Hits.ToString
    End Function

    ''' Accessor method for the Player_Information Runs_Scored count
    Public Function Get_Runs_Scored()
        Return Runs_Scored.ToString
    End Function

    ''' Accessor method for the Player_Information Runs_Batted_In count
    Public Function Get_RBIs()
        Return Runs_Batted_In.ToString
    End Function

    ''' Accessor method for the Player_Information Doubles count
    Public Function Get_Doubles()
        Return Doubles.ToString
    End Function

    ''' Accessor method for the Player_Information Triples count
    Public Function Get_Triples()
        Return Triples.ToString
    End Function

    ''' Accessor method for the Player_Information Home_Runs count
    Public Function Get_Home_Runs()
        Return Home_Runs.ToString
    End Function

    ''' Accessor method for the Player_Information Walks_Batting count
    Public Function Get_Walks()
        Return Walks_Batting.ToString
    End Function

    ''' Accessor method for the Player_Information Errors count
    Public Function Get_Errors()
        Return Errors.ToString
    End Function

    ''' Accessor method for the Player_Information StrikeOuts count
    Public Function Get_Strikeouts()
        Return StrikeOuts.ToString
    End Function

    ''' Accessor method for the Player_Information Steals count
    Public Function Get_Steals()
        Return Steals.ToString
    End Function

    ''' Accessor method for the Player_Information Batting Average
    Public Function Get_Average()
        Dim return_val As Decimal
        If At_Bats = 0 Then
            return_val = 0.000
            Return return_val
        Else
            return_val = Hits / At_Bats
            return_val = Math.Round(return_val, 3)
            Return return_val
        End If
    End Function

    ''' Accessor method to get the position number of the Player_Information
    Public Function Get_PositionNumber()

        If (Get_Position() = "P") Then
            Return 0

        ElseIf (Get_Position() = "C") Then
            Return 1

        ElseIf (Get_Position() = "1B") Then
            Return 2

        ElseIf (Get_Position() = "2B") Then
            Return 3

        ElseIf (Get_Position() = "3B") Then
            Return 4

        ElseIf (Get_Position() = "SS") Then
            Return 5

        ElseIf (Get_Position() = "LF") Then
            Return 6

        ElseIf (Get_Position() = "CF") Then
            Return 7

        Else
            Return 8

        End If

    End Function

    ''' Mutator to set the name and position of Player_Information
    Public Sub Update_Name_Position(ByVal set_name As String, ByVal position_set As String)
        name = set_name
        position = position_set
    End Sub

    ''' Mutator for the Player_Information Hits count
    Public Sub Update_Hits()
        Hits += 1
    End Sub

    ''' Mutator for the Player_Information Double count
    Public Sub Update_Doubles()
        Doubles += 1
    End Sub

    ''' Mutator for the Player_Information Triple count
    Public Sub Update_Triples()
        Triples += 1
    End Sub

    ''' Mutator for the Player_Information Home_Run count
    Public Sub Update_HomeRuns()
        Home_Runs += 1
    End Sub

    ''' Mutator for the Player_Information Strikes_Thrown count
    Public Sub Update_StrikesThrown()
        Strikes += 1
    End Sub

    ''' Mutator for the Player_Information Strikes_Thrown count
    Public Sub Update_BallsThrown()
        Balls += 1
    End Sub

    ''' Mutator for the Player Information Total_Pitches count
    Public Sub Update_Pitches_Total()
        Total_Pitches += 1
    End Sub

    ''' Mutator for the Player Information At_Bats count
    Public Sub Update_AtBats()
        At_Bats += 1
    End Sub

    ''' Mutator for the Player Information Strikeouts_Thrown count
    Public Sub Update_Strikeouts()
        Strikeouts_Thrown += 1
    End Sub

    ''' Mutator for the Player Information Walks_Pitched count
    Public Sub Update_WalksThrown()
        Walks_Pitched += 1
    End Sub

    ''' Mutator for the Player Information StrikeOuts count
    Public Sub Update_StrikeoutsBatting()
        StrikeOuts += 1
    End Sub

    ''' Mutator for the Player Information Walks_Batting count
    Public Sub Update_WalksBatting()
        Walks_Batting += 1
    End Sub

    ''' Mutator for the Player Information Errors count
    Public Sub Update_Errors()
        Errors += 1
    End Sub

    ''' Mutator for the Player Information Runs_Given count
    ''' Receive: integer number_runs; number of runs the pitcher just gave up
    Public Sub Update_RunsGiven(ByVal number_runs As Integer)
        Runs_Given += number_runs
    End Sub

    ''' Mutator for the Player Information Hits_Given count
    Public Sub Update_HitsGiven()
        Hits_Given += 1
    End Sub

    ''' Mutator for the Player Information Runs_Batted_In count
    ''' Receive: integer number_runs; number of runs the batter hit in
    Public Sub Update_RBIs(ByVal number_runs As Integer)
        Runs_Batted_In += number_runs
    End Sub

    ''' Mutator for the Player_Information Runs_Scored count
    Public Sub Update_RunsScored()
        Runs_Scored += 1
    End Sub

End Class
