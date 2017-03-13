''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' MainWindow.xaml.vb controls the actions from the MainWindow.xaml file for my Final Project
''' 
''' Created by: Ethan Clark for CS 214 Final Project
''' Date: Spring 2016

Class MainWindow

    ' Declare variables that are needed in the functions below for the MainWindow Class
    Dim new_player As String

    ' An instance of each HomeTeam and AwayTeam
    Dim away_team As New AwayTeam
    Dim home_team As New HomeTeam

    ' Create arrays that stores the positions of the fielders for a baseball game
    Dim player_list() = New String() {"Pitcher", "Catcher", "First Base", "Second Base", "Third Base",
                                        "Short Stop", "Left Field", "Center Field", "Right Field"}
    Dim shorten_list() = New String() {"P", "C", "1B", "2B", "3B", "SS", "LF", "CF", "RF"}

    Dim top_or_bottom As Boolean = True

    ' Variables to help keep track if both home and away team players have been entered
    Dim HomeTeam_Entered As Boolean = False
    Dim AwayTeam_Entered As Boolean = False

    ' Variables to keep track of the current batter for each team
    Dim current_home_batter As Integer = 0
    Dim current_away_batter As Integer = 0

    ' Variable to keep track of what inning the game is in
    Dim inning_count_var As Integer = 1

    ''' Variables to keep track of the current strikes, balls, and outs during the game
    Dim current_strikes As Integer = 0
    Dim current_balls As Integer = 0
    Dim current_outs As Integer = 0

    ' Variables to keep track of the score of the game
    Dim current_home_score As Integer = 0
    Dim current_away_score As Integer = 0

    ' Temp variables to keep track of any current base runners during the game
    Dim temp_first_runner As Player_Information = Nothing
    Dim temp_second_runner As Player_Information = Nothing
    Dim temp_third_runner As Player_Information = Nothing

    ''' Subprogram used to enter the home team roster
    '''     Handles the Home Team Button on the Main Window
    ''' Receive:
    ''' Output: Repeatedly prompts the user for the name of the player at different positions.
    Private Sub button_Click(sender As Object, e As RoutedEventArgs) Handles Home_Player_button.Click

        home_team.Make_Roster()

        For number As Integer = 0 To 8
            new_player = InputBox("Please enter the " + player_list(number))
            home_team.roster(number).Update_Name_Position(new_player, shorten_list(number))
        Next

        HomeTeam_Entered = True

        ' Remove the Roster buttons and add the other buttons for clarity purposes
        If HomeTeam_Entered And AwayTeam_Entered Then
            displayHome.Visibility = Visibility.Visible
            displayAway.Visibility = Visibility.Visible
            Statistics.Visibility = Visibility.Visible
            start_game_button.Visibility = Visibility.Visible
            Submit_Button.Visibility = Visibility.Visible
            Home_Player_button.Visibility = Visibility.Hidden
            Away_Player_button.Visibility = Visibility.Hidden
            Instructions.Content = ""
        End If

    End Sub

    ''' Subprogram that displays the roster of the home team to the user.
    '''     Handles the Display Home Team Button on the Main Window.
    ''' Receive:
    ''' Output: Displays the names and the positions for the Home Team in a new Window.
    Private Sub button_Click_1(sender As Object, e As RoutedEventArgs) Handles displayHome.Click
        Dim Team_Display As String = "Home Team Roster" + Environment.NewLine + Environment.NewLine
        For number As Integer = 0 To home_team.roster.Length - 1
            Team_Display = Team_Display + player_list(number) + ": " +
                                       home_team.roster(number).Get_Name() + Environment.NewLine
        Next
        MessageBox.Show(Team_Display)

    End Sub

    ''' Subprogram used to enter the away team roster.
    '''     Handles the Away Team Button on the Main Window.
    ''' Receive:
    ''' Output: Repeatedly prompts the user to enter the players for respective positions.
    Private Sub Away_Player_button_Click(sender As Object, e As RoutedEventArgs) Handles Away_Player_button.Click

        away_team.Make_Roster()

        For number As Integer = 0 To 8
            new_player = InputBox("Please enter the " + player_list(number))
            away_team.roster(number).Update_Name_Position(new_player, shorten_list(number))
        Next

        AwayTeam_Entered = True

        ' Remove the Roster buttons and add the other buttons for clarity purposes
        If HomeTeam_Entered And AwayTeam_Entered Then
            displayHome.Visibility = Visibility.Visible
            displayAway.Visibility = Visibility.Visible
            Statistics.Visibility = Visibility.Visible
            start_game_button.Visibility = Visibility.Visible
            Submit_Button.Visibility = Visibility.Visible
            Home_Player_button.Visibility = Visibility.Hidden
            Away_Player_button.Visibility = Visibility.Hidden
            Instructions.Content = ""
        End If

    End Sub

    ''' Subprogram that displays the roster of the away team to the user.
    '''     Handles the Display Away Team Button on the Main Window.
    ''' Receive:
    ''' Output: Opens a window that displays the names and positions of the away team.
    Private Sub button_Click_2(sender As Object, e As RoutedEventArgs) Handles displayAway.Click
        Dim Team_Display As String = "Away Team Roster" + Environment.NewLine + Environment.NewLine
        For number As Integer = 0 To away_team.roster.Length - 1
            Team_Display = Team_Display + player_list(number) + ": " +
                                        away_team.roster(number).Get_Name() + Environment.NewLine
        Next
        MessageBox.Show(Team_Display)

    End Sub

    ''' Subprogram to display the Field Players for whichever team is in the field.
    ''' Receive: NONE
    ''' Output: Displays the Field Players in their respective positions in black on the GUI.
    Private Sub Field_Label_Text()
        If top_or_bottom Then
            Pitcher_Label.Content = home_team.roster(0).Get_Name()
            Catcher_Label.Content = home_team.roster(1).Get_Name()
            First_Base_Label.Content = home_team.roster(2).Get_Name()
            Second_Base_Label.Content = home_team.roster(3).Get_Name()
            Third_Base_Label.Content = home_team.roster(4).Get_Name()
            Short_Stop_Label.Content = home_team.roster(5).Get_Name()
            Left_Field_Label.Content = home_team.roster(6).Get_Name()
            Center_Field_Label.Content = home_team.roster(7).Get_Name()
            Right_Field_Label.Content = home_team.roster(8).Get_Name()
        Else
            Pitcher_Label.Content = away_team.roster(0).Get_Name()
            Catcher_Label.Content = away_team.roster(1).Get_Name()
            First_Base_Label.Content = away_team.roster(2).Get_Name()
            Second_Base_Label.Content = away_team.roster(3).Get_Name()
            Third_Base_Label.Content = away_team.roster(4).Get_Name()
            Short_Stop_Label.Content = away_team.roster(5).Get_Name()
            Left_Field_Label.Content = away_team.roster(6).Get_Name()
            Center_Field_Label.Content = away_team.roster(7).Get_Name()
            Right_Field_Label.Content = away_team.roster(8).Get_Name()
        End If

    End Sub

    ''' Subprogram to display the current player up to bat.
    ''' Receive: NONE
    ''' Output: Displays the name of the current hitter next to home plate
    '''         in blue letters.
    Private Sub Hitter_Label_Text()
        If Not (top_or_bottom) Then
            Hitter_Label.Content = ""
            Hitter_Label.Content = home_team.roster(current_home_batter).Get_Name()
            home_team.roster(current_home_batter).Update_AtBats()
        Else
            Hitter_Label.Content = ""
            Hitter_Label.Content = away_team.roster(current_away_batter).Get_Name()
            away_team.roster(current_away_batter).Update_AtBats()
        End If

    End Sub

    ''' Subprogram to display the current inning.
    ''' Receive: NONE
    ''' Output: Displays what inning the game is currently in on the GUI.
    Private Sub Display_Inning()
        If top_or_bottom Then
            Inning_Count.Content = "Top of " + inning_count_var.ToString
        Else
            Inning_Count.Content = "Bottom of " + inning_count_var.ToString
        End If
    End Sub

    ''' Subprogram to display the current strikes, balls, outs.
    ''' Receive: NONE
    ''' Output: Displays the strike count, ball count, and out count on the GUI.
    Private Sub Display_General_Information()
        Strike_Count.Content = current_strikes
        Ball_Count.Content = current_balls
        Out_Count.Content = current_outs
    End Sub

    ''' Subprogram to display the current score.
    ''' Receive: NONE
    ''' Output: Displays the home and away scores.
    Private Sub Display_Score()
        Home_Count_Score.Content = current_home_score
        Away_Count_Score.Content = current_away_score
    End Sub

    ''' Subprogram to display the current, udpated pitch count label text.
    ''' Receive: NONE
    ''' Output: Displays the Pitchers names and their pitch counts.
    Private Sub Pitch_Count_Text()
        Home_Pitch_Count.Content = home_team.roster(0).Get_Name() + ": " + home_team.roster(0).Get_Pitch_Count()
        Away_Pitch_Count.Content = away_team.roster(0).Get_Name() + ": " + away_team.roster(0).Get_Pitch_Count()
    End Sub

    ''' Subprogram to display some of the graphical contents of the GUI.
    '''     Activated by the Start Game Button.
    ''' Receive:
    ''' Output: Displays the necessary information for the user on the GUI and begins
    '''         the process of the baseball game.
    Private Sub start_game_Click(sender As Object, e As RoutedEventArgs) Handles start_game_button.Click
        General_Info.Content = "Strikes:" + Environment.NewLine + "Balls:" + Environment.NewLine + "Outs:"
        Field_Label_Text()
        Hitter_Label_Text()
        Display_General_Information()
        Display_Inning()
        Display_Score()
        Pitch_Count_Text()
    End Sub

    ''' Subprogram to open the Statistics Window when the Button is clicked.
    ''' Receive:
    ''' Output: A new window pops up for the user to see with each team's statistics.
    Private Sub Statistics_Click(sender As Object, e As RoutedEventArgs) Handles Statistics.Click

        ' Create a new Window and title it Game Statistics
        Dim stats_Window As New Window
        stats_Window.Title = "Game Statistics"

        ' Enter everything into the String variable display_stats
        Dim display_stats As String = "Player" + ControlChars.Tab + "Position" + ControlChars.Tab +
                                        "At Bats" + ControlChars.Tab + "Hits" + ControlChars.Tab + "Doubles" +
                                        ControlChars.Tab + "Triples" + ControlChars.Tab + "Home Runs" + ControlChars.Tab +
                                        "Walks" + ControlChars.Tab + "Stolen Bases" + ControlChars.Tab + "RBIs" +
                                        ControlChars.Tab + "Runs" + ControlChars.Tab + "Strikeouts" + ControlChars.Tab +
                                        "Errors" + ControlChars.Tab + "Batting Average" + Environment.NewLine

        For number As Integer = 0 To home_team.roster.Length - 1
            Dim temp_player = home_team.roster(number)
            display_stats = display_stats + temp_player.Get_Name() +
                            ControlChars.Tab + temp_player.Get_Position() +
                            ControlChars.Tab + temp_player.Get_At_Bats() +
                            ControlChars.Tab + temp_player.Get_Hits() +
                            ControlChars.Tab + temp_player.Get_Doubles() +
                            ControlChars.Tab + temp_player.Get_Triples() +
                            ControlChars.Tab + temp_player.Get_Home_Runs() +
                            ControlChars.Tab + ControlChars.Tab + temp_player.Get_Walks() +
                            ControlChars.Tab + temp_player.Get_Steals() +
                            ControlChars.Tab + ControlChars.Tab + temp_player.Get_RBIs() +
                            ControlChars.Tab + temp_player.Get_Runs_Scored() +
                            ControlChars.Tab + temp_player.Get_Strikeouts() +
                            ControlChars.Tab + ControlChars.Tab + temp_player.Get_Errors() +
                            ControlChars.Tab + temp_player.Get_Average().ToString() + Environment.NewLine
        Next

        display_stats += Environment.NewLine

        For number As Integer = 0 To away_team.roster.Length - 1
            Dim temp_player = away_team.roster(number)
            display_stats = display_stats + temp_player.Get_Name() +
                            ControlChars.Tab + temp_player.Get_Position() +
                            ControlChars.Tab + temp_player.Get_At_Bats() +
                            ControlChars.Tab + temp_player.Get_Hits() +
                            ControlChars.Tab + temp_player.Get_Doubles() +
                            ControlChars.Tab + temp_player.Get_Triples() +
                            ControlChars.Tab + temp_player.Get_Home_Runs() +
                            ControlChars.Tab + ControlChars.Tab + temp_player.Get_Walks() +
                            ControlChars.Tab + temp_player.Get_Steals() +
                            ControlChars.Tab + ControlChars.Tab + temp_player.Get_RBIs() +
                            ControlChars.Tab + temp_player.Get_Runs_Scored() +
                            ControlChars.Tab + temp_player.Get_Strikeouts() +
                            ControlChars.Tab + ControlChars.Tab + temp_player.Get_Errors() +
                            ControlChars.Tab + temp_player.Get_Average().ToString() + Environment.NewLine
        Next

        display_stats += Environment.NewLine + "Pitcher Stats" + Environment.NewLine

        display_stats += "Player" + ControlChars.Tab + "Pitch Count" + ControlChars.Tab + "Strikes" +
                        ControlChars.Tab + "Balls" + ControlChars.Tab + "Walks" + ControlChars.Tab +
                        "Strikeouts" + ControlChars.Tab + "Earned Runs" + ControlChars.Tab + "Hits" +
                        Environment.NewLine

        Dim temp_player1 = home_team.roster(0)
        display_stats += temp_player1.Get_Name() + ControlChars.Tab +
                        temp_player1.Get_Pitch_Count() + ControlChars.Tab + ControlChars.Tab +
                        temp_player1.Get_Strikes() + ControlChars.Tab +
                        temp_player1.Get_Balls() + ControlChars.Tab +
                        temp_player1.Get_Walks_Thrown() + ControlChars.Tab +
                        temp_player1.Get_Strikeouts_Thrown() + ControlChars.Tab + ControlChars.Tab +
                        temp_player1.Get_RunsGiven() + ControlChars.Tab + ControlChars.Tab +
                        temp_player1.Get_Hits_Given() + ControlChars.Tab + Environment.NewLine

        Dim temp_player2 = away_team.roster(0)
        display_stats += temp_player2.Get_Name() + ControlChars.Tab +
                        temp_player2.Get_Pitch_Count() + ControlChars.Tab + ControlChars.Tab +
                        temp_player2.Get_Strikes() + ControlChars.Tab +
                        temp_player2.Get_Balls() + ControlChars.Tab +
                        temp_player2.Get_Walks_Thrown() + ControlChars.Tab +
                        temp_player2.Get_Strikeouts_Thrown() + ControlChars.Tab + ControlChars.Tab +
                        temp_player2.Get_RunsGiven() + ControlChars.Tab + ControlChars.Tab +
                        temp_player2.Get_Hits_Given() + ControlChars.Tab + Environment.NewLine

        stats_Window.Content = display_stats

        ' Open the new Window to display to the user
        stats_Window.Show()

    End Sub

    ''' Subprogram to calculate and display the winner of the game
    ''' Receive: NONE
    ''' Output: MessageBox to the user informing them of the winner
    Private Sub Compute_EndGame()
        If current_home_score > current_away_score Then
            MessageBox.Show("Game Over: Home Team wins " + current_home_score.ToString() +
                            " to " + current_away_score.ToString() + "!")
        Else
            MessageBox.Show("Game Over: Away Team wins " + current_away_score.ToString() +
                            " to " + current_home_score.ToString() + "!")
        End If
        Submit_Button.Visibility = Visibility.Hidden
    End Sub

    ''' Subprogram that updates the next hitter or if there were three outs
    '''         switches the home and away teams in the field.
    ''' Receive: NONE
    ''' Output: current_home_batter or current_away_batter update accordingly
    '''         and updates the necessary display information on the GUI.
    Private Sub next_hitter()

        ' If home_team is batting
        If Not (top_or_bottom) Then
            current_home_batter += 1
            If current_home_batter = 9 Then
                current_home_batter = 0
            End If
            ' Else if away_team is batting
        Else
            current_away_batter += 1
            If current_away_batter = 9 Then
                current_away_batter = 0
            End If
        End If

        ' If there are three outs, the inning is over
        If current_outs = 3 Then
            MessageBox.Show("Switch!")
            current_outs = 0
            If top_or_bottom Then
                top_or_bottom = False
            Else
                top_or_bottom = True
                inning_count_var += 1
            End If
            Field_Label_Text()

            ' See if the game should be over
            If (inning_count_var > 9) And (current_away_score <> current_home_score) And (top_or_bottom = True) Then
                Compute_EndGame()
            End If

            temp_first_runner = Nothing
            temp_second_runner = Nothing
            temp_third_runner = Nothing

            First_Runner_Label.Content = ""
            Second_Runner_Label.Content = ""
            Third_Runner_Label.Content = ""

            If inning_count_var < 10 Then
                DisplayRunners()
                Display_Inning()
            End If

        End If

        ' Display the next hitter
        If inning_count_var < 10 Then
            Hitter_Label_Text()
        End If

    End Sub

    ''' Subprogram to display the runners that are on base.
    ''' Receive: NONE
    ''' Output: If there are runners on base, display their names by the base.
    Private Sub DisplayRunners()

        ' If there is a runner on first base
        If Not (IsNothing(temp_first_runner)) Then
            First_Runner_Label.Content = temp_first_runner.Get_Name()
        Else
            First_Runner_Label.Content = " "
        End If
        ' If there is a runner on second base
        If Not (IsNothing(temp_second_runner)) Then
            Second_Runner_Label.Content = temp_second_runner.Get_Name()
        Else
            Second_Runner_Label.Content = " "
        End If
        ' If there is a runner on third base
        If Not (IsNothing(temp_third_runner)) Then
            Third_Runner_Label.Content = temp_third_runner.Get_Name()
        Else
            Third_Runner_Label.Content = " "
        End If

    End Sub

    ''' Subprogram to deal with the runners on base.
    ''' RECEIVE: Hit_Type; an integer describing if the hit was a single (1),
    '''     double (2), triple (3), or a home run (4). A walk is set to (0).
    ''' Output: Performs the actions and updates the necessary statistics for the necessary
    '''     players in their Player_Information Class.
    Private Sub Perform_BaseRunners(ByVal hit_type As Integer)

        ' Perform the necessary base runner updates for a walk
        If hit_type = 0 Then

            ' If the bases are loaded (runners on first, second, and third)
            If Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) And
                    Not (IsNothing(temp_first_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = temp_second_runner
                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on third and second
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) Then

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there are runners on first and third
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_first_runner)) Then

                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there are runners on first and second
            ElseIf Not (IsNothing(temp_first_runner)) And Not (IsNothing(temp_second_runner)) Then

                temp_third_runner = temp_second_runner
                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there is a runner on third base
            ElseIf Not (IsNothing(temp_third_runner)) Then

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there is a runner on second base
            ElseIf Not (IsNothing(temp_second_runner)) Then

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there is a runner on first base
            ElseIf Not (IsNothing(temp_first_runner)) Then
                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there are no runners on base
            Else

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            End If

        ' Perform the necessary base runner updates for a single
        ElseIf hit_type = 1 Then

            ' If the bases are loaded (runners on first, second, and third)
            If Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) And
                    Not (IsNothing(temp_first_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = temp_second_runner
                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on third and second
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = temp_second_runner
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on first and third
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_first_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_second_runner = temp_first_runner
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on first and second
            ElseIf Not (IsNothing(temp_first_runner)) And Not (IsNothing(temp_second_runner)) Then

                temp_third_runner = temp_second_runner
                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there is a runner on third base
            ElseIf Not (IsNothing(temp_third_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_first_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there is a runner on second base
            ElseIf Not (IsNothing(temp_second_runner)) Then
                temp_third_runner = temp_second_runner
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there is a runner on first base
            ElseIf Not (IsNothing(temp_first_runner)) Then
                temp_second_runner = temp_first_runner

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            ' If there are no runners on base
            Else

                If Not (top_or_bottom) Then
                    temp_first_runner = home_team.roster(current_home_batter)
                Else
                    temp_first_runner = away_team.roster(current_away_batter)
                End If

            End If

        ' Perform the necessary base runner updates for a double
        ElseIf hit_type = 2 Then

            ' If the bases are loaded (runners on first, second, and third)
            If Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) And
                    Not (IsNothing(temp_first_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = temp_first_runner
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    temp_second_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    temp_second_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on third and second
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    temp_second_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(Second).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    temp_second_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on first and third
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_first_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = temp_first_runner
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on first and second
            ElseIf Not (IsNothing(temp_first_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                temp_third_runner = temp_first_runner
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(second).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(second).Update_RunsScored()
                End If

            ' If there is a runner on third base
            ElseIf Not (IsNothing(temp_third_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there is a runner on second base
            ElseIf Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    temp_second_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(second).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_second_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(second).Update_RunsScored()
                End If

            ' If there is a runner on first base
            ElseIf Not (IsNothing(temp_first_runner)) Then
                temp_third_runner = temp_first_runner
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    temp_second_runner = home_team.roster(current_home_batter)
                Else
                    temp_second_runner = away_team.roster(current_away_batter)
                End If

            ' If there are no runners on base
            Else

                If Not (top_or_bottom) Then
                    temp_second_runner = home_team.roster(current_home_batter)
                Else
                    temp_second_runner = away_team.roster(current_away_batter)
                End If

            End If

        ' Perform the necessary base runner updates for a triple
        ElseIf hit_type = 3 Then

            ' If the bases are loaded (runners on first, second, and third)
            If Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) And
                    Not (IsNothing(temp_first_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_first_runner = Nothing
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 3
                    away_team.roster(0).Update_RunsGiven(3)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(3)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 3
                    home_team.roster(0).Update_RunsGiven(3)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(3)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on third and second
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on first and third
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_first_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there are runners on first and second
            ElseIf Not (IsNothing(temp_first_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                temp_first_runner = Nothing
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(second).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(second).Update_RunsScored()
                End If

            ' If there is a runner on third base
            ElseIf Not (IsNothing(temp_third_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(third).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(third).Update_RunsScored()
                End If

            ' If there is a runner on second base
            ElseIf Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(second).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(second).Update_RunsScored()
                End If

            ' If there is a runner on first base
            ElseIf Not (IsNothing(temp_first_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    temp_third_runner = home_team.roster(current_home_batter)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(first).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    temp_third_runner = away_team.roster(current_away_batter)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(first).Update_RunsScored()
                End If

            ' If there are no runners on base
            Else

                If Not (top_or_bottom) Then
                    temp_third_runner = home_team.roster(current_home_batter)
                Else
                    temp_third_runner = away_team.roster(current_away_batter)
                End If

            End If

        ' Perform the necessary base runner updates for a home run
        ElseIf hit_type = 4 Then

            ' If the bases are loaded (runners on first, second, and third)
            If Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) And
                   Not (IsNothing(temp_first_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_first_runner = Nothing
                temp_second_runner = Nothing
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 4
                    away_team.roster(0).Update_RunsGiven(4)
                    home_team.roster(current_home_batter).Update_RBIs(4)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 4
                    home_team.roster(0).Update_RunsGiven(4)
                    away_team.roster(current_away_batter).Update_RBIs(4)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there are runners on third and second
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = Nothing
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 3
                    away_team.roster(0).Update_RunsGiven(3)
                    home_team.roster(current_home_batter).Update_RBIs(3)
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 3
                    home_team.roster(0).Update_RunsGiven(3)
                    away_team.roster(current_away_batter).Update_RBIs(3)
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there are runners on first and third
            ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_first_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_first_runner = Nothing
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 3
                    away_team.roster(0).Update_RunsGiven(3)
                    home_team.roster(current_home_batter).Update_RBIs(3)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(third).Update_RunsScored()
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 3
                    home_team.roster(0).Update_RunsGiven(3)
                    away_team.roster(current_away_batter).Update_RBIs(3)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(third).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there are runners on first and second
            ElseIf Not (IsNothing(temp_first_runner)) And Not (IsNothing(temp_second_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                temp_first_runner = Nothing
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 3
                    away_team.roster(0).Update_RunsGiven(3)
                    home_team.roster(current_home_batter).Update_RBIs(3)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 3
                    home_team.roster(0).Update_RunsGiven(3)
                    away_team.roster(current_away_batter).Update_RBIs(3)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there is a runner on third base
            ElseIf Not (IsNothing(temp_third_runner)) Then

                Dim third As Integer = temp_third_runner.Get_PositionNumber()
                temp_third_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(third).Update_RunsScored()
                    home_team.roster(current_away_batter).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(third).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there is a runner on second base
            ElseIf Not (IsNothing(temp_second_runner)) Then

                Dim second As Integer = temp_second_runner.Get_PositionNumber()
                temp_second_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(second).Update_RunsScored()
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(second).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there is a runner on first base
            ElseIf Not (IsNothing(temp_first_runner)) Then

                Dim first As Integer = temp_first_runner.Get_PositionNumber()
                temp_first_runner = Nothing

                If Not (top_or_bottom) Then
                    current_home_score += 2
                    away_team.roster(0).Update_RunsGiven(2)
                    home_team.roster(current_home_batter).Update_RBIs(2)
                    home_team.roster(first).Update_RunsScored()
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 2
                    home_team.roster(0).Update_RunsGiven(2)
                    away_team.roster(current_away_batter).Update_RBIs(2)
                    away_team.roster(first).Update_RunsScored()
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            ' If there are no runners on base
            Else

                If Not (top_or_bottom) Then
                    current_home_score += 1
                    away_team.roster(0).Update_RunsGiven(1)
                    home_team.roster(current_home_batter).Update_RBIs(1)
                    home_team.roster(current_home_batter).Update_RunsScored()
                Else
                    current_away_score += 1
                    home_team.roster(0).Update_RunsGiven(1)
                    away_team.roster(current_away_batter).Update_RBIs(1)
                    away_team.roster(current_away_batter).Update_RunsScored()
                End If

            End If

        End If

    End Sub

    ''' Subprogram to deal with the base runners after an error has been made.
    '''     Only difference between Display_Runners_Error() and Perform_BaseRunners()
    '''     is that when an error has been made, the batter is not given an RBI.
    ''' Receive: NONE
    ''' Output: Base runners move accordingly after an error.
    Public Sub Display_Runners_Error()

        ' If the bases are loaded (runners on first, second, and third)
        If Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) And
                    Not (IsNothing(temp_first_runner)) Then

            Dim third As Integer = temp_third_runner.Get_PositionNumber()
            temp_third_runner = temp_second_runner
            temp_second_runner = temp_first_runner

            If Not (top_or_bottom) Then
                current_home_score += 1
                away_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = home_team.roster(current_home_batter)
                home_team.roster(third).Update_RunsScored()
            Else
                current_away_score += 1
                home_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = away_team.roster(current_away_batter)
                away_team.roster(third).Update_RunsScored()
            End If

        ' If there are runners on second and third
        ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_second_runner)) Then

            Dim third As Integer = temp_third_runner.Get_PositionNumber()
            temp_third_runner = temp_second_runner
            temp_second_runner = Nothing

            If Not (top_or_bottom) Then
                current_home_score += 1
                away_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = home_team.roster(current_home_batter)
                home_team.roster(third).Update_RunsScored()
            Else
                current_away_score += 1
                home_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = away_team.roster(current_away_batter)
                away_team.roster(third).Update_RunsScored()
            End If

        ' If there are runners on first and third
        ElseIf Not (IsNothing(temp_third_runner)) And Not (IsNothing(temp_first_runner)) Then

            Dim third As Integer = temp_third_runner.Get_PositionNumber()
            temp_second_runner = temp_first_runner
            temp_third_runner = Nothing

            If Not (top_or_bottom) Then
                current_home_score += 1
                away_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = home_team.roster(current_home_batter)
                home_team.roster(third).Update_RunsScored()
            Else
                current_away_score += 1
                home_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = away_team.roster(current_away_batter)
                away_team.roster(third).Update_RunsScored()
            End If

        ' If there are runners on second and first
        ElseIf Not (IsNothing(temp_first_runner)) And Not (IsNothing(temp_second_runner)) Then

            temp_third_runner = temp_second_runner
            temp_second_runner = temp_first_runner

            If Not (top_or_bottom) Then
                temp_first_runner = home_team.roster(current_home_batter)
            Else
                temp_first_runner = away_team.roster(current_away_batter)
            End If

        ' If there is a runner on third base
        ElseIf Not (IsNothing(temp_third_runner)) Then

            Dim third As Integer = temp_third_runner.Get_PositionNumber()
            temp_third_runner = Nothing

            If Not (top_or_bottom) Then
                current_home_score += 1
                away_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = home_team.roster(current_home_batter)
                home_team.roster(third).Update_RunsScored()
            Else
                current_away_score += 1
                home_team.roster(0).Update_RunsGiven(1)
                temp_first_runner = away_team.roster(current_away_batter)
                away_team.roster(third).Update_RunsScored()
            End If

        ' If there is a runner on second base
        ElseIf Not (IsNothing(temp_second_runner)) Then
            temp_third_runner = temp_second_runner
            temp_second_runner = Nothing

            If Not (top_or_bottom) Then
                temp_first_runner = home_team.roster(current_home_batter)
            Else
                temp_first_runner = away_team.roster(current_away_batter)
            End If

        ' If there is a runner on first base
        ElseIf Not (IsNothing(temp_first_runner)) Then
            temp_second_runner = temp_first_runner

            If Not (top_or_bottom) Then
                temp_first_runner = home_team.roster(current_home_batter)
            Else
                temp_first_runner = away_team.roster(current_away_batter)
            End If

        ' If there are no runners on base
        Else

            If Not (top_or_bottom) Then
                temp_first_runner = home_team.roster(current_home_batter)
            Else
                temp_first_runner = away_team.roster(current_away_batter)
            End If

        End If

    End Sub

    ''' Subprogram to read in the current radio button selections
    '''         and update the necessary variables for the Home or Away Team Players.
    ''' Receive:
    ''' Output: Checks which radio button was selected and updates the necessary
    '''         statistics in the Player_Information Class and the display information on the GUI.
    Private Sub Submit_Button_Click(sender As Object, e As RoutedEventArgs) Handles Submit_Button.Click

        ' Actions to perform if the batter hit a single
        If Single_Hit.IsChecked Then
            If top_or_bottom Then
                away_team.roster(current_away_batter).Update_Hits()
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_HitsGiven()
            Else
                home_team.roster(current_home_batter).Update_Hits()
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_HitsGiven()
            End If
            Perform_BaseRunners(1)
            Single_Hit.IsChecked = False
            current_strikes = 0
            current_balls = 0
            next_hitter()

        ' Actions to perform if the batter hit a double
        ElseIf Double_Hit.IsChecked Then
            If top_or_bottom Then
                away_team.roster(current_away_batter).Update_Doubles()
                away_team.roster(current_away_batter).Update_Hits()
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_HitsGiven()
            Else
                home_team.roster(current_home_batter).Update_Doubles()
                home_team.roster(current_home_batter).Update_Hits()
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_HitsGiven()
            End If
            Perform_BaseRunners(2)
            Double_Hit.IsChecked = False
            current_strikes = 0
            current_balls = 0
            next_hitter()

        ' Actions to perform if the batter hit a triple
        ElseIf Triple_Hit.IsChecked Then
            If top_or_bottom Then
                away_team.roster(current_away_batter).Update_Triples()
                away_team.roster(current_away_batter).Update_Hits()
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_HitsGiven()
            Else
                home_team.roster(current_home_batter).Update_Triples()
                home_team.roster(current_home_batter).Update_Hits()
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_HitsGiven()
            End If
            Perform_BaseRunners(3)
            Triple_Hit.IsChecked = False
            current_strikes = 0
            current_balls = 0
            next_hitter()

        ' Actions to perform if the batter hit a home run
        ElseIf Home_Run.IsChecked Then
            If top_or_bottom Then
                away_team.roster(current_away_batter).Update_HomeRuns()
                away_team.roster(current_away_batter).Update_Hits()
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_HitsGiven()
            Else
                home_team.roster(current_home_batter).Update_HomeRuns()
                home_team.roster(current_home_batter).Update_Hits()
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_HitsGiven()
            End If
            Perform_BaseRunners(4)
            Home_Run.IsChecked = False
            current_strikes = 0
            current_balls = 0
            next_hitter()

        ' Actions to perform if the pitch was a called strike
        ElseIf Strike_Radio.IsChecked Then
            If Not (top_or_bottom) Then
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_Pitches_Total()
            Else
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_Pitches_Total()
            End If

            If current_strikes < 2 Then
                current_strikes += 1
            Else
                If Not (top_or_bottom) Then
                    away_team.roster(0).Update_Strikeouts()
                    home_team.roster(current_home_batter).Update_StrikeoutsBatting()
                Else
                    home_team.roster(0).Update_Strikeouts()
                    away_team.roster(current_away_batter).Update_StrikeoutsBatting()
                End If
                MessageBox.Show("Strikeout!")
                current_outs += 1
                current_strikes = 0
                current_balls = 0
                next_hitter()
            End If
            Strike_Radio.IsChecked = False

        ' Actions to perform if the pitch was a called ball
        ElseIf Ball_Radio.IsChecked Then
            If Not (top_or_bottom) Then
                away_team.roster(0).Update_BallsThrown()
                away_team.roster(0).Update_Pitches_Total()
            Else
                home_team.roster(0).Update_BallsThrown()
                home_team.roster(0).Update_Pitches_Total()
            End If

            If current_balls < 3 Then
                current_balls += 1
            Else
                If Not (top_or_bottom) Then
                    away_team.roster(0).Update_WalksThrown()
                    home_team.roster(current_home_batter).Update_WalksBatting()
                Else
                    home_team.roster(0).Update_WalksThrown()
                    away_team.roster(current_away_batter).Update_WalksBatting()
                End If
                MessageBox.Show("Walk!")
                Perform_BaseRunners(0)
                current_balls = 0
                current_strikes = 0
                next_hitter()
            End If
            Ball_Radio.IsChecked = False

            ' Actions to perform if the pitch was fouled off
        ElseIf Foul_Radio.IsChecked Then
            If Not (top_or_bottom) Then
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_Pitches_Total()
            Else
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_Pitches_Total()
            End If
            If current_strikes < 2 Then
                current_strikes += 1
            End If
            Foul_Radio.IsChecked = False

        ' Actions to perform if the batter flied out
        ElseIf Fly_Out_Label.IsChecked Then
            current_outs += 1
            If Not (top_or_bottom) Then
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_Pitches_Total()
            Else
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_Pitches_Total()
            End If
            next_hitter()
            current_strikes = 0
            current_balls = 0
            Fly_Out_Label.IsChecked = False

        ' Actions to perform if the batter grounded out
        ElseIf Ground_Out_Label.IsChecked Then
            current_outs += 1
            If Not (top_or_bottom) Then
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_Pitches_Total()
            Else
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_Pitches_Total()
            End If
            next_hitter()
            current_strikes = 0
            current_balls = 0
            Ground_Out_Label.IsChecked = False

            ' Actions to perform if the batter lined out
        ElseIf Line_Out_Label.IsChecked Then
            current_outs += 1
            If Not (top_or_bottom) Then
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_Pitches_Total()
            Else
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_Pitches_Total()
            End If
            next_hitter()
            current_strikes = 0
            current_balls = 0
            Line_Out_Label.IsChecked = False

        End If

        If inning_count_var < 10 Then

            ' Check to see if there was an error on the play and call the error_detector()
            error_detector()

            ' Update the displays of the necessary information
            Display_General_Information()
            Pitch_Count_Text()
            DisplayRunners()
            Display_Score()

        End If

    End Sub

    ''' Subprogram that checks to see if there was an error.
    '''         Uses the comboBox from the interface and checks the index
    '''         of the currently selected comboBoxItem.
    ''' Receive: NONE
    ''' Output: Determines if an error was made and updates the necessary Player_Information
    '''         statistics and updates necessary display information on the GUI.
    Private Sub error_detector()

        ' If the home team makes an error
        If top_or_bottom Then

            ' If the pitcher commits an error
            If comboBox.SelectedIndex = 0 Then
                Dim message_string = "Error on Pitcher " + home_team.roster(0).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(0).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the catcher commits an error
            If comboBox.SelectedIndex = 1 Then
                Dim message_string = "Error on Catcher " + home_team.roster(1).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(1).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the first baseman commits an error
            If comboBox.SelectedIndex = 2 Then
                Dim message_string = "Error on First Baseman " + home_team.roster(2).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(2).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the second baseman commits an error
            If comboBox.SelectedIndex = 3 Then
                Dim message_string = "Error on Second Baseman " + home_team.roster(3).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(3).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the third baseman commits an error
            If comboBox.SelectedIndex = 4 Then
                Dim message_string = "Error on Third Baseman " + home_team.roster(4).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(4).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the short stop commits an error
            If comboBox.SelectedIndex = 5 Then
                Dim message_string = "Error on Short Stop " + home_team.roster(5).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(5).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the left fielder commits an error
            If comboBox.SelectedIndex = 6 Then
                Dim message_string = "Error on Left Fielder " + home_team.roster(6).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(6).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the center fielder commits an error
            If comboBox.SelectedIndex = 7 Then
                Dim message_string = "Error on Center Fielder " + home_team.roster(7).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_Pitches_Total()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(7).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the right fielder commits an error
            If comboBox.SelectedIndex = 8 Then
                Dim message_string = "Error on Right Fielder " + home_team.roster(8).Get_Name()
                MessageBox.Show(message_string)
                home_team.roster(0).Update_BallsThrown()
                home_team.roster(0).Update_StrikesThrown()
                home_team.roster(8).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' Else if the away team commits an error
        Else

            ' If the pitcher commits an error
            If comboBox.SelectedIndex = 0 Then
                Dim message_string = "Error on Pitcher " + away_team.roster(0).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(0).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the catcher commits an error
            If comboBox.SelectedIndex = 1 Then
                Dim message_string = "Error on Catcher " + away_team.roster(1).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(1).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the first baseman commits an error
            If comboBox.SelectedIndex = 2 Then
                Dim message_string = "Error on First Baseman " + away_team.roster(2).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(2).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the second baseman commits an error
            If comboBox.SelectedIndex = 3 Then
                Dim message_string = "Error on Second Baseman " + away_team.roster(3).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(3).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the third baseman commits an error
            If comboBox.SelectedIndex = 4 Then
                Dim message_string = "Error on Third Baseman " + away_team.roster(4).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(4).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the short stop commits an error
            If comboBox.SelectedIndex = 5 Then
                Dim message_string = "Error on Short Stop " + away_team.roster(5).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(5).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the left fielder commits an error
            If comboBox.SelectedIndex = 6 Then
                Dim message_string = "Error on Left Fielder " + away_team.roster(6).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(6).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the center fielder commits an error
            If comboBox.SelectedIndex = 7 Then
                Dim message_string = "Error on Center Fielder " + away_team.roster(7).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(7).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

            ' If the right fielder commits an error
            If comboBox.SelectedIndex = 8 Then
                Dim message_string = "Error on Right Fielder " + away_team.roster(8).Get_Name()
                MessageBox.Show(message_string)
                away_team.roster(0).Update_Pitches_Total()
                away_team.roster(0).Update_StrikesThrown()
                away_team.roster(8).Update_Errors()
                comboBox.SelectedIndex = -1
                Display_Runners_Error()
                next_hitter()
            End If

        End If

    End Sub

End Class
