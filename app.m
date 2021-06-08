classdef okienkowo < matlab.apps.AppBase
    % Autor: Anton Yushkevich
    % Gra Saper
    % Zasady:
    % Na planszy gry znajduje siê pewna liczba bomb. Trzeba otworzyæ
    % wszystkie komórki gry oprócz tych, gdzie znajduj¹ siê bomby.
    % Na ka¿dej z otworzonych komórek jest napisana liczba bomb obok
    % (w kwadracie 3x3 z centrum w tej komórce) jeœli ta liczba jest
    % wiêksza od zera. Komórki mo¿na oznaczaæ flag¹ (nie bêd¹ otworzone).
    % W prawym górnym rogu jest liczba jeszcze nie zaznaczonych flag¹
    % bomb (postawienie flagi zminiejsza t¹ liczbê niezale¿nie od tego,
    % czy ona by³a postawiona na komórkê z bomb¹ czy nie). Liczba flag 
    % nie jest ograniczona. Opracowanie otwarzania komórki z bomb¹ 
    % czy komórki bez bomby w okolice mo¿e zajmowaæ pewien czas.
    % Dla zmiany poziomu trudnoœci trzeba wybraæ odpowiedni i klikn¹æ
    % przycisk restart.
    % Gra siê koñczy po otworzeniu wszystkich komórek bez bomb lub 
    % po klikniêciu na komórkê z bomb¹.

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        RestartButton     matlab.ui.control.Button
        ButtonGroup       matlab.ui.container.ButtonGroup
        CursorButton      matlab.ui.control.RadioButton
        FlagButton        matlab.ui.control.RadioButton
        FlagImage         matlab.ui.control.Image
        CursorImage       matlab.ui.control.Image
        LevelChoice       matlab.ui.control.DropDown
        MinesLeft1        matlab.ui.control.Image
        MinesLeft2        matlab.ui.control.Image
        Field             matlab.ui.container.ButtonGroup
        Cell_1_1          matlab.ui.control.Button
        Cell_1_2          matlab.ui.control.Button
        Cell_1_3          matlab.ui.control.Button
        Cell_1_4          matlab.ui.control.Button
        Cell_1_5          matlab.ui.control.Button
        Cell_1_6          matlab.ui.control.Button
        Cell_1_7          matlab.ui.control.Button
        Cell_1_8          matlab.ui.control.Button
        Cell_1_9          matlab.ui.control.Button
        Cell_1_10         matlab.ui.control.Button
        Cell_1_11         matlab.ui.control.Button
        Cell_1_12         matlab.ui.control.Button
        Cell_1_13         matlab.ui.control.Button
        Cell_1_14         matlab.ui.control.Button
        Cell_1_15         matlab.ui.control.Button
        Cell_2_1          matlab.ui.control.Button
        Cell_2_2          matlab.ui.control.Button
        Cell_2_3          matlab.ui.control.Button
        Cell_2_4          matlab.ui.control.Button
        Cell_2_5          matlab.ui.control.Button
        Cell_2_6          matlab.ui.control.Button
        Cell_2_7          matlab.ui.control.Button
        Cell_2_8          matlab.ui.control.Button
        Cell_2_9          matlab.ui.control.Button
        Cell_2_10         matlab.ui.control.Button
        Cell_2_11         matlab.ui.control.Button
        Cell_2_12         matlab.ui.control.Button
        Cell_2_13         matlab.ui.control.Button
        Cell_2_14         matlab.ui.control.Button
        Cell_2_15         matlab.ui.control.Button
        Cell_3_1          matlab.ui.control.Button
        Cell_3_2          matlab.ui.control.Button
        Cell_3_3          matlab.ui.control.Button
        Cell_3_4          matlab.ui.control.Button
        Cell_3_5          matlab.ui.control.Button
        Cell_3_6          matlab.ui.control.Button
        Cell_3_7          matlab.ui.control.Button
        Cell_3_8          matlab.ui.control.Button
        Cell_3_9          matlab.ui.control.Button
        Cell_3_10         matlab.ui.control.Button
        Cell_3_11         matlab.ui.control.Button
        Cell_3_12         matlab.ui.control.Button
        Cell_3_13         matlab.ui.control.Button
        Cell_3_14         matlab.ui.control.Button
        Cell_3_15         matlab.ui.control.Button
        Cell_4_1          matlab.ui.control.Button
        Cell_4_2          matlab.ui.control.Button
        Cell_4_3          matlab.ui.control.Button
        Cell_4_4          matlab.ui.control.Button
        Cell_4_5          matlab.ui.control.Button
        Cell_4_6          matlab.ui.control.Button
        Cell_4_7          matlab.ui.control.Button
        Cell_4_8          matlab.ui.control.Button
        Cell_4_9          matlab.ui.control.Button
        Cell_4_10         matlab.ui.control.Button
        Cell_4_11         matlab.ui.control.Button
        Cell_4_12         matlab.ui.control.Button
        Cell_4_13         matlab.ui.control.Button
        Cell_4_14         matlab.ui.control.Button
        Cell_4_15         matlab.ui.control.Button
        Cell_5_1          matlab.ui.control.Button
        Cell_5_2          matlab.ui.control.Button
        Cell_5_3          matlab.ui.control.Button
        Cell_5_4          matlab.ui.control.Button
        Cell_5_5          matlab.ui.control.Button
        Cell_5_6          matlab.ui.control.Button
        Cell_5_7          matlab.ui.control.Button
        Cell_5_8          matlab.ui.control.Button
        Cell_5_9          matlab.ui.control.Button
        Cell_5_10         matlab.ui.control.Button
        Cell_5_11         matlab.ui.control.Button
        Cell_5_12         matlab.ui.control.Button
        Cell_5_13         matlab.ui.control.Button
        Cell_5_14         matlab.ui.control.Button
        Cell_5_15         matlab.ui.control.Button
        Cell_6_1          matlab.ui.control.Button
        Cell_6_2          matlab.ui.control.Button
        Cell_6_3          matlab.ui.control.Button
        Cell_6_4          matlab.ui.control.Button
        Cell_6_5          matlab.ui.control.Button
        Cell_6_6          matlab.ui.control.Button
        Cell_6_7          matlab.ui.control.Button
        Cell_6_8          matlab.ui.control.Button
        Cell_6_9          matlab.ui.control.Button
        Cell_6_10         matlab.ui.control.Button
        Cell_6_11         matlab.ui.control.Button
        Cell_6_12         matlab.ui.control.Button
        Cell_6_13         matlab.ui.control.Button
        Cell_6_14         matlab.ui.control.Button
        Cell_6_15         matlab.ui.control.Button
        Cell_7_1          matlab.ui.control.Button
        Cell_7_2          matlab.ui.control.Button
        Cell_7_3          matlab.ui.control.Button
        Cell_7_4          matlab.ui.control.Button
        Cell_7_5          matlab.ui.control.Button
        Cell_7_6          matlab.ui.control.Button
        Cell_7_7          matlab.ui.control.Button
        Cell_7_8          matlab.ui.control.Button
        Cell_7_9          matlab.ui.control.Button
        Cell_7_10         matlab.ui.control.Button
        Cell_7_11         matlab.ui.control.Button
        Cell_7_12         matlab.ui.control.Button
        Cell_7_13         matlab.ui.control.Button
        Cell_7_14         matlab.ui.control.Button
        Cell_7_15         matlab.ui.control.Button
        Cell_8_1          matlab.ui.control.Button
        Cell_8_2          matlab.ui.control.Button
        Cell_8_3          matlab.ui.control.Button
        Cell_8_4          matlab.ui.control.Button
        Cell_8_5          matlab.ui.control.Button
        Cell_8_6          matlab.ui.control.Button
        Cell_8_7          matlab.ui.control.Button
        Cell_8_8          matlab.ui.control.Button
        Cell_8_9          matlab.ui.control.Button
        Cell_8_10         matlab.ui.control.Button
        Cell_8_11         matlab.ui.control.Button
        Cell_8_12         matlab.ui.control.Button
        Cell_8_13         matlab.ui.control.Button
        Cell_8_14         matlab.ui.control.Button
        Cell_8_15         matlab.ui.control.Button
        Cell_9_1          matlab.ui.control.Button
        Cell_9_2          matlab.ui.control.Button
        Cell_9_3          matlab.ui.control.Button
        Cell_9_4          matlab.ui.control.Button
        Cell_9_5          matlab.ui.control.Button
        Cell_9_6          matlab.ui.control.Button
        Cell_9_7          matlab.ui.control.Button
        Cell_9_8          matlab.ui.control.Button
        Cell_9_9          matlab.ui.control.Button
        Cell_9_10         matlab.ui.control.Button
        Cell_9_11         matlab.ui.control.Button
        Cell_9_12         matlab.ui.control.Button
        Cell_9_13         matlab.ui.control.Button
        Cell_9_14         matlab.ui.control.Button
        Cell_9_15         matlab.ui.control.Button
        Cell_10_1         matlab.ui.control.Button
        Cell_10_2         matlab.ui.control.Button
        Cell_10_3         matlab.ui.control.Button
        Cell_10_4         matlab.ui.control.Button
        Cell_10_5         matlab.ui.control.Button
        Cell_10_6         matlab.ui.control.Button
        Cell_10_7         matlab.ui.control.Button
        Cell_10_8         matlab.ui.control.Button
        Cell_10_9         matlab.ui.control.Button
        Cell_10_10        matlab.ui.control.Button
        Cell_10_11        matlab.ui.control.Button
        Cell_10_12        matlab.ui.control.Button
        Cell_10_13        matlab.ui.control.Button
        Cell_10_14        matlab.ui.control.Button
        Cell_10_15        matlab.ui.control.Button
        Cell_11_1         matlab.ui.control.Button
        Cell_11_2         matlab.ui.control.Button
        Cell_11_3         matlab.ui.control.Button
        Cell_11_4         matlab.ui.control.Button
        Cell_11_5         matlab.ui.control.Button
        Cell_11_6         matlab.ui.control.Button
        Cell_11_7         matlab.ui.control.Button
        Cell_11_8         matlab.ui.control.Button
        Cell_11_9         matlab.ui.control.Button
        Cell_11_10        matlab.ui.control.Button
        Cell_11_11        matlab.ui.control.Button
        Cell_11_12        matlab.ui.control.Button
        Cell_11_13        matlab.ui.control.Button
        Cell_11_14        matlab.ui.control.Button
        Cell_11_15        matlab.ui.control.Button
        Cell_12_1         matlab.ui.control.Button
        Cell_12_2         matlab.ui.control.Button
        Cell_12_3         matlab.ui.control.Button
        Cell_12_4         matlab.ui.control.Button
        Cell_12_5         matlab.ui.control.Button
        Cell_12_6         matlab.ui.control.Button
        Cell_12_7         matlab.ui.control.Button
        Cell_12_8         matlab.ui.control.Button
        Cell_12_9         matlab.ui.control.Button
        Cell_12_10        matlab.ui.control.Button
        Cell_12_11        matlab.ui.control.Button
        Cell_12_12        matlab.ui.control.Button
        Cell_12_13        matlab.ui.control.Button
        Cell_12_14        matlab.ui.control.Button
        Cell_12_15        matlab.ui.control.Button
        Cell_13_1         matlab.ui.control.Button
        Cell_13_2         matlab.ui.control.Button
        Cell_13_3         matlab.ui.control.Button
        Cell_13_4         matlab.ui.control.Button
        Cell_13_5         matlab.ui.control.Button
        Cell_13_6         matlab.ui.control.Button
        Cell_13_7         matlab.ui.control.Button
        Cell_13_8         matlab.ui.control.Button
        Cell_13_9         matlab.ui.control.Button
        Cell_13_10        matlab.ui.control.Button
        Cell_13_11        matlab.ui.control.Button
        Cell_13_12        matlab.ui.control.Button
        Cell_13_13        matlab.ui.control.Button
        Cell_13_14        matlab.ui.control.Button
        Cell_13_15        matlab.ui.control.Button
        Cell_14_1         matlab.ui.control.Button
        Cell_14_2         matlab.ui.control.Button
        Cell_14_3         matlab.ui.control.Button
        Cell_14_4         matlab.ui.control.Button
        Cell_14_5         matlab.ui.control.Button
        Cell_14_6         matlab.ui.control.Button
        Cell_14_7         matlab.ui.control.Button
        Cell_14_8         matlab.ui.control.Button
        Cell_14_9         matlab.ui.control.Button
        Cell_14_10        matlab.ui.control.Button
        Cell_14_11        matlab.ui.control.Button
        Cell_14_12        matlab.ui.control.Button
        Cell_14_13        matlab.ui.control.Button
        Cell_14_14        matlab.ui.control.Button
        Cell_14_15        matlab.ui.control.Button
        Cell_15_1         matlab.ui.control.Button
        Cell_15_2         matlab.ui.control.Button
        Cell_15_3         matlab.ui.control.Button
        Cell_15_4         matlab.ui.control.Button
        Cell_15_5         matlab.ui.control.Button
        Cell_15_6         matlab.ui.control.Button
        Cell_15_7         matlab.ui.control.Button
        Cell_15_8         matlab.ui.control.Button
        Cell_15_9         matlab.ui.control.Button
        Cell_15_10        matlab.ui.control.Button
        Cell_15_11        matlab.ui.control.Button
        Cell_15_12        matlab.ui.control.Button
        Cell_15_13        matlab.ui.control.Button
        Cell_15_14        matlab.ui.control.Button
        Cell_15_15        matlab.ui.control.Button
        MinesweeperLabel  matlab.ui.control.Label
    end

    
    properties (Access = private)
        % Liczba pozosta³ych (nieoznaczonych flag¹) bomb
        mines = 0;
        
        % Zawiera informacjê o komórkach gry
        % (spacje przed "2 - jest postawiona.." by³y dodane dla cztelnoœci)
        % data(y, x, 1) == s
        % data(y, x, 2) == n
        % x - kolumna komórki
        % y - wiersz komórki
        % s - stan komórki (0 - zamkniêta, 1 - otwarta, ...
        %                   2 - jest postawiona flaga)
        % n - liczba bomb wokó³ komórki (-1 - bomba jest w tej komórce)
        data = [];
        
        % Poziom trudnoœci gry
        % 0 - easy (niski)
        % 1 - medium (œredni)
        % 2 - hard (wysoki)
        level = 1;
    end
    
    methods (Access = private)
        
        function click_cell(app, button, pos_x, pos_y)
            if get(app.FlagButton, "Value")
                if app.data(pos_y, pos_x, 1) == 0
                    button.set("Icon", "flag_button.jpg");
                    app.data(pos_y, pos_x, 1) = 2;
                    app.mines = app.mines - 1;
                elseif app.data(pos_y, pos_x, 1) == 2
                    button.set("Icon", "");
                    app.data(pos_y, pos_x, 1) = 0;
                    app.mines = app.mines + 1;
                end
                print_mines_left(app);
            else
                button.set("Enable", "off");
                app.data(pos_y, pos_x, 1) = 1;
                if app.data(pos_y, pos_x, 2) == -1
                    button.set("BackgroundColor", [1, 0, 0]);
                    game_lost(app);
                else
                    open_field(app, pos_x, pos_y);
                end
                if sum(sum(app.data(:, :, 1) == 0)) == app.mines
                    game_won(app);
                end
            end
        end
        
        function init_data(app)
            if app.level == 0
                app.mines = 20;
            elseif app.level == 1
                app.mines = 50;
            else
                app.mines = 80;
            end
            
            app.data = zeros(15);
            app.data(:,:,2) = app.data;
            x = randi(15);
            y = randi(15);
            app.data(y, x, 2) = -1;
            for i = 2:app.mines
                while app.data(y, x, 2) == -1
                    x = randi(15);
                    y = randi(15);
                end
                app.data(y, x, 2) = -1;
            end
            
            fake_data = [zeros(1, 17); ...
                zeros(15, 1), app.data(:, :, 2), zeros(15, 1); ...
                zeros(1, 17)];
            for x = 2:16
                for y = 2:16
                    if app.data(y-1, x-1, 2) ~= -1
                        app.data(y-1, x-1, 2) = ...
                            -sum(sum(fake_data(y-1:y+1, x-1:x+1)));
                    end
                end
            end
        end
        
        function print_mines_left(app)
            if app.mines <= 0
                app.MinesLeft1.set("ImageSource", "0_mine.png");
                app.MinesLeft2.set("ImageSource", "0_mine.png");
            else
                n = floor(app.mines/10);
                app.MinesLeft1.set("ImageSource", int2str(n)+"_mine.png");
                n = mod(app.mines, 10);
                app.MinesLeft2.set("ImageSource", int2str(n)+"_mine.png");
            end
        end
        
        function open_field(app, x, y)
            to_open = zeros(15);
            if app.data(y, x, 2) == 0
                to_open(y, x) = 2;
            else
                to_open(y, x) = 1;
            end
            founded = true;
            while founded
                founded = false;
                for x = 1:15
                    for y = 1:15
                        if to_open(y, x) > 0
                            cell = find_button_by_pos(app, x, y);
                            cell.set("Enable", "off");
                            if app.data(y, x, 1) == 2
                                cell.set("Icon", "");
                                app.mines = app.mines + 1;
                                print_mines_left(app);
                            end
                            app.data(y, x, 1) = 1;
                            if app.data(y, x, 2) > 0
                                n = app.data(y, x, 2);
                                cell.set("Icon", int2str(n)+".png");
                            end
                            if to_open(y, x) == 2
                                for j = max(x-1, 1):min(x+1, 15)
                                   for i = max(y-1, 1):min(y+1, 15)
                                        if to_open(i, j) == 0 && ...
                                                app.data(i, j, 2) ~= -1
                                            founded = true;
                                            if app.data(i, j, 2) == 0
                                                to_open(i, j) = 2;
                                            else
                                                to_open(i, j) = 1;
                                            end
                                        end
                                    end
                                end
                            end
                            to_open(y, x) = -1;
                        end
                    end
                end
            end
        end
        
        function game_lost(app)
            app.RestartButton.set("Icon", "lost.png");
            app.MinesweeperLabel.set("Text", "Lost!");
            for cell = findobj(app.Field, "Type", "uibutton")
                cell.set("Enable", "off");
            end
            for x = 1:15
                for y = 1:15
                    if app.data(y, x, 2) == -1
                        cell = find_button_by_pos(app, x, y);
                        cell.set("Icon", "mine.png");
                    end
                end
            end
        end
        
        function button = find_button_by_pos(app, pos_x, pos_y)
            button = findobj(app.Field, "Type", "uibutton", ...
                "Position", [(pos_x - 1)*20, 300 - pos_y*20, 20, 20]);
        end
        
        function game_won(app)
            app.RestartButton.set("Icon", "won.png");
            app.MinesweeperLabel.set("Text", "Won!");
            for cell = findobj(app.Field, "Type", "uibutton")
                cell.set("Enable", "off");
            end
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            init_data(app);
            print_mines_left(app);
        end

        % Selection changed function: ButtonGroup
        function ButtonGroupSelectionChanged(app, event)
            selectedButton = app.ButtonGroup.SelectedObject;
            if selectedButton == app.CursorButton
                state = "off";
            else
                state = "on";
            end
            flagged = findobj(app.Field, "Icon", "flag_button.jpg");
            for cell = flagged
                cell.set("Enable", state);
            end
        end

        % Button pushed function: RestartButton
        function RestartButtonPushed(app, event)
            init_data(app);
            print_mines_left(app);
            app.RestartButton.set("Icon", "restart_button.jpg");
            app.MinesweeperLabel.set("Text", "Minesweeper");
            for cell = findobj(app.Field, "Type", "uibutton")
                cell.set("Icon", "");
                cell.set("Enable", "on");
                cell.set("BackgroundColor", [0.96, 0.96, 0.96]);
            end
        end

        % Value changed function: LevelChoice
        function LevelChoiceValueChanged(app, event)
            value = app.LevelChoice.Value;
            if value == "Easy"
                app.level = 0;
            elseif value == "Medium"
                app.level = 1;
            else
                app.level = 2;
            end
        end

        % Button pushed function: Cell_1_1
        function Cell_1_1ButtonPushed(app, event)
            click_cell(app, app.Cell_1_1, 1, 1);
        end

        % Button pushed function: Cell_1_2
        function Cell_1_2ButtonPushed(app, event)
            click_cell(app, app.Cell_1_2, 2, 1);
        end

        % Button pushed function: Cell_1_3
        function Cell_1_3ButtonPushed(app, event)
            click_cell(app, app.Cell_1_3, 3, 1);
        end

        % Button pushed function: Cell_1_4
        function Cell_1_4ButtonPushed(app, event)
            click_cell(app, app.Cell_1_4, 4, 1);
        end

        % Button pushed function: Cell_1_5
        function Cell_1_5ButtonPushed(app, event)
            click_cell(app, app.Cell_1_5, 5, 1);
        end

        % Button pushed function: Cell_1_6
        function Cell_1_6ButtonPushed(app, event)
            click_cell(app, app.Cell_1_6, 6, 1);
        end

        % Button pushed function: Cell_1_7
        function Cell_1_7ButtonPushed(app, event)
            click_cell(app, app.Cell_1_7, 7, 1);
        end

        % Button pushed function: Cell_1_8
        function Cell_1_8ButtonPushed(app, event)
            click_cell(app, app.Cell_1_8, 8, 1);
        end

        % Button pushed function: Cell_1_9
        function Cell_1_9ButtonPushed(app, event)
            click_cell(app, app.Cell_1_9, 9, 1);
        end

        % Button pushed function: Cell_1_10
        function Cell_1_10ButtonPushed(app, event)
            click_cell(app, app.Cell_1_10, 10, 1);
        end

        % Button pushed function: Cell_1_11
        function Cell_1_11ButtonPushed(app, event)
            click_cell(app, app.Cell_1_11, 11, 1);
        end

        % Button pushed function: Cell_1_12
        function Cell_1_12ButtonPushed(app, event)
            click_cell(app, app.Cell_1_12, 12, 1);
        end

        % Button pushed function: Cell_1_13
        function Cell_1_13ButtonPushed(app, event)
            click_cell(app, app.Cell_1_13, 13, 1);
        end

        % Button pushed function: Cell_1_14
        function Cell_1_14ButtonPushed(app, event)
            click_cell(app, app.Cell_1_14, 14, 1);
        end

        % Button pushed function: Cell_1_15
        function Cell_1_15ButtonPushed(app, event)
            click_cell(app, app.Cell_1_15, 15, 1);
        end

        % Button pushed function: Cell_2_1
        function Cell_2_1ButtonPushed(app, event)
            click_cell(app, app.Cell_2_1, 1, 2);
        end

        % Button pushed function: Cell_2_2
        function Cell_2_2ButtonPushed(app, event)
            click_cell(app, app.Cell_2_2, 2, 2);
        end

        % Button pushed function: Cell_2_3
        function Cell_2_3ButtonPushed(app, event)
            click_cell(app, app.Cell_2_3, 3, 2);
        end

        % Button pushed function: Cell_2_4
        function Cell_2_4ButtonPushed(app, event)
            click_cell(app, app.Cell_2_4, 4, 2);
        end

        % Button pushed function: Cell_2_5
        function Cell_2_5ButtonPushed(app, event)
            click_cell(app, app.Cell_2_5, 5, 2);
        end

        % Button pushed function: Cell_2_6
        function Cell_2_6ButtonPushed(app, event)
            click_cell(app, app.Cell_2_6, 6, 2);
        end

        % Button pushed function: Cell_2_7
        function Cell_2_7ButtonPushed(app, event)
            click_cell(app, app.Cell_2_7, 7, 2);
        end

        % Button pushed function: Cell_2_8
        function Cell_2_8ButtonPushed(app, event)
            click_cell(app, app.Cell_2_8, 8, 2);
        end

        % Button pushed function: Cell_2_9
        function Cell_2_9ButtonPushed(app, event)
            click_cell(app, app.Cell_2_9, 9, 2);
        end

        % Button pushed function: Cell_2_10
        function Cell_2_10ButtonPushed(app, event)
            click_cell(app, app.Cell_2_10, 10, 2);
        end

        % Button pushed function: Cell_2_11
        function Cell_2_11ButtonPushed(app, event)
            click_cell(app, app.Cell_2_11, 11, 2);
        end

        % Button pushed function: Cell_2_12
        function Cell_2_12ButtonPushed(app, event)
            click_cell(app, app.Cell_2_12, 12, 2);
        end

        % Button pushed function: Cell_2_13
        function Cell_2_13ButtonPushed(app, event)
            click_cell(app, app.Cell_2_13, 13, 2);
        end

        % Button pushed function: Cell_2_14
        function Cell_2_14ButtonPushed(app, event)
            click_cell(app, app.Cell_2_14, 14, 2);
        end

        % Button pushed function: Cell_2_15
        function Cell_2_15ButtonPushed(app, event)
            click_cell(app, app.Cell_2_15, 15, 2);
        end

        % Button pushed function: Cell_3_1
        function Cell_3_1ButtonPushed(app, event)
            click_cell(app, app.Cell_3_1, 1, 3);
        end

        % Button pushed function: Cell_3_2
        function Cell_3_2ButtonPushed(app, event)
            click_cell(app, app.Cell_3_2, 2, 3);
        end

        % Button pushed function: Cell_3_3
        function Cell_3_3ButtonPushed(app, event)
            click_cell(app, app.Cell_3_3, 3, 3);
        end

        % Button pushed function: Cell_3_4
        function Cell_3_4ButtonPushed(app, event)
            click_cell(app, app.Cell_3_4, 4, 3);
        end

        % Button pushed function: Cell_3_5
        function Cell_3_5ButtonPushed(app, event)
            click_cell(app, app.Cell_3_5, 5, 3);
        end

        % Button pushed function: Cell_3_6
        function Cell_3_6ButtonPushed(app, event)
            click_cell(app, app.Cell_3_6, 6, 3);
        end

        % Button pushed function: Cell_3_7
        function Cell_3_7ButtonPushed(app, event)
            click_cell(app, app.Cell_3_7, 7, 3);
        end

        % Button pushed function: Cell_3_8
        function Cell_3_8ButtonPushed(app, event)
            click_cell(app, app.Cell_3_8, 8, 3);
        end

        % Button pushed function: Cell_3_9
        function Cell_3_9ButtonPushed(app, event)
            click_cell(app, app.Cell_3_9, 9, 3);
        end

        % Button pushed function: Cell_3_10
        function Cell_3_10ButtonPushed(app, event)
            click_cell(app, app.Cell_3_10, 10, 3);
        end

        % Button pushed function: Cell_3_11
        function Cell_3_11ButtonPushed(app, event)
            click_cell(app, app.Cell_3_11, 11, 3);
        end

        % Button pushed function: Cell_3_12
        function Cell_3_12ButtonPushed(app, event)
            click_cell(app, app.Cell_3_12, 12, 3);
        end

        % Button pushed function: Cell_3_13
        function Cell_3_13ButtonPushed(app, event)
            click_cell(app, app.Cell_3_13, 13, 3);
        end

        % Button pushed function: Cell_3_14
        function Cell_3_14ButtonPushed(app, event)
            click_cell(app, app.Cell_3_14, 14, 3);
        end

        % Button pushed function: Cell_3_15
        function Cell_3_15ButtonPushed(app, event)
            click_cell(app, app.Cell_3_15, 15, 3);
        end

        % Button pushed function: Cell_4_1
        function Cell_4_1ButtonPushed(app, event)
            click_cell(app, app.Cell_4_1, 1, 4);
        end

        % Button pushed function: Cell_4_2
        function Cell_4_2ButtonPushed(app, event)
            click_cell(app, app.Cell_4_2, 2, 4);
        end

        % Button pushed function: Cell_4_3
        function Cell_4_3ButtonPushed(app, event)
            click_cell(app, app.Cell_4_3, 3, 4);
        end

        % Button pushed function: Cell_4_4
        function Cell_4_4ButtonPushed(app, event)
            click_cell(app, app.Cell_4_4, 4, 4);
        end

        % Button pushed function: Cell_4_5
        function Cell_4_5ButtonPushed(app, event)
            click_cell(app, app.Cell_4_5, 5, 4);
        end

        % Button pushed function: Cell_4_6
        function Cell_4_6ButtonPushed(app, event)
            click_cell(app, app.Cell_4_6, 6, 4);
        end

        % Button pushed function: Cell_4_7
        function Cell_4_7ButtonPushed(app, event)
            click_cell(app, app.Cell_4_7, 7, 4);
        end

        % Button pushed function: Cell_4_8
        function Cell_4_8ButtonPushed(app, event)
            click_cell(app, app.Cell_4_8, 8, 4);
        end

        % Button pushed function: Cell_4_9
        function Cell_4_9ButtonPushed(app, event)
            click_cell(app, app.Cell_4_9, 9, 4);
        end

        % Button pushed function: Cell_4_10
        function Cell_4_10ButtonPushed(app, event)
            click_cell(app, app.Cell_4_10, 10, 4);
        end

        % Button pushed function: Cell_4_11
        function Cell_4_11ButtonPushed(app, event)
            click_cell(app, app.Cell_4_11, 11, 4);
        end

        % Button pushed function: Cell_4_12
        function Cell_4_12ButtonPushed(app, event)
            click_cell(app, app.Cell_4_12, 12, 4);
        end

        % Button pushed function: Cell_4_13
        function Cell_4_13ButtonPushed(app, event)
            click_cell(app, app.Cell_4_13, 13, 4);
        end

        % Button pushed function: Cell_4_14
        function Cell_4_14ButtonPushed(app, event)
            click_cell(app, app.Cell_4_14, 14, 4);
        end

        % Button pushed function: Cell_4_15
        function Cell_4_15ButtonPushed(app, event)
            click_cell(app, app.Cell_4_15, 15, 4);
        end

        % Button pushed function: Cell_5_1
        function Cell_5_1ButtonPushed(app, event)
            click_cell(app, app.Cell_5_1, 1, 5);
        end

        % Button pushed function: Cell_5_2
        function Cell_5_2ButtonPushed(app, event)
            click_cell(app, app.Cell_5_2, 2, 5);
        end

        % Button pushed function: Cell_5_3
        function Cell_5_3ButtonPushed(app, event)
            click_cell(app, app.Cell_5_3, 3, 5);
        end

        % Button pushed function: Cell_5_4
        function Cell_5_4ButtonPushed(app, event)
            click_cell(app, app.Cell_5_4, 4, 5);
        end

        % Button pushed function: Cell_5_5
        function Cell_5_5ButtonPushed(app, event)
            click_cell(app, app.Cell_5_5, 5, 5);
        end

        % Button pushed function: Cell_5_6
        function Cell_5_6ButtonPushed(app, event)
            click_cell(app, app.Cell_5_6, 6, 5);
        end

        % Button pushed function: Cell_5_7
        function Cell_5_7ButtonPushed(app, event)
            click_cell(app, app.Cell_5_7, 7, 5);
        end

        % Button pushed function: Cell_5_8
        function Cell_5_8ButtonPushed(app, event)
            click_cell(app, app.Cell_5_8, 8, 5);
        end

        % Button pushed function: Cell_5_9
        function Cell_5_9ButtonPushed(app, event)
            click_cell(app, app.Cell_5_9, 9, 5);
        end

        % Button pushed function: Cell_5_10
        function Cell_5_10ButtonPushed(app, event)
            click_cell(app, app.Cell_5_10, 10, 5);
        end

        % Button pushed function: Cell_5_11
        function Cell_5_11ButtonPushed(app, event)
            click_cell(app, app.Cell_5_11, 11, 5);
        end

        % Button pushed function: Cell_5_12
        function Cell_5_12ButtonPushed(app, event)
            click_cell(app, app.Cell_5_12, 12, 5);
        end

        % Button pushed function: Cell_5_13
        function Cell_5_13ButtonPushed(app, event)
            click_cell(app, app.Cell_5_13, 13, 5);
        end

        % Button pushed function: Cell_5_14
        function Cell_5_14ButtonPushed(app, event)
            click_cell(app, app.Cell_5_14, 14, 5);
        end

        % Button pushed function: Cell_5_15
        function Cell_5_15ButtonPushed(app, event)
            click_cell(app, app.Cell_5_15, 15, 5);
        end

        % Button pushed function: Cell_6_1
        function Cell_6_1ButtonPushed(app, event)
            click_cell(app, app.Cell_6_1, 1, 6);
        end

        % Button pushed function: Cell_6_2
        function Cell_6_2ButtonPushed(app, event)
            click_cell(app, app.Cell_6_2, 2, 6);
        end

        % Button pushed function: Cell_6_3
        function Cell_6_3ButtonPushed(app, event)
            click_cell(app, app.Cell_6_3, 3, 6);
        end

        % Button pushed function: Cell_6_4
        function Cell_6_4ButtonPushed(app, event)
            click_cell(app, app.Cell_6_4, 4, 6);
        end

        % Button pushed function: Cell_6_5
        function Cell_6_5ButtonPushed(app, event)
            click_cell(app, app.Cell_6_5, 5, 6);
        end

        % Button pushed function: Cell_6_6
        function Cell_6_6ButtonPushed(app, event)
            click_cell(app, app.Cell_6_6, 6, 6);
        end

        % Button pushed function: Cell_6_7
        function Cell_6_7ButtonPushed(app, event)
            click_cell(app, app.Cell_6_7, 7, 6);
        end

        % Button pushed function: Cell_6_8
        function Cell_6_8ButtonPushed(app, event)
            click_cell(app, app.Cell_6_8, 8, 6);
        end

        % Button pushed function: Cell_6_9
        function Cell_6_9ButtonPushed(app, event)
            click_cell(app, app.Cell_6_9, 9, 6);
        end

        % Button pushed function: Cell_6_10
        function Cell_6_10ButtonPushed(app, event)
            click_cell(app, app.Cell_6_10, 10, 6);
        end

        % Button pushed function: Cell_6_11
        function Cell_6_11ButtonPushed(app, event)
            click_cell(app, app.Cell_6_11, 11, 6);
        end

        % Button pushed function: Cell_6_12
        function Cell_6_12ButtonPushed(app, event)
            click_cell(app, app.Cell_6_12, 12, 6);
        end

        % Button pushed function: Cell_6_13
        function Cell_6_13ButtonPushed(app, event)
            click_cell(app, app.Cell_6_13, 13, 6);
        end

        % Button pushed function: Cell_6_14
        function Cell_6_14ButtonPushed(app, event)
            click_cell(app, app.Cell_6_14, 14, 6);
        end

        % Button pushed function: Cell_6_15
        function Cell_6_15ButtonPushed(app, event)
            click_cell(app, app.Cell_6_15, 15, 6);
        end

        % Button pushed function: Cell_7_1
        function Cell_7_1ButtonPushed(app, event)
            click_cell(app, app.Cell_7_1, 1, 7);
        end

        % Button pushed function: Cell_7_2
        function Cell_7_2ButtonPushed(app, event)
            click_cell(app, app.Cell_7_2, 2, 7);
        end

        % Button pushed function: Cell_7_3
        function Cell_7_3ButtonPushed(app, event)
            click_cell(app, app.Cell_7_3, 3, 7);
        end

        % Button pushed function: Cell_7_4
        function Cell_7_4ButtonPushed(app, event)
            click_cell(app, app.Cell_7_4, 4, 7);
        end

        % Button pushed function: Cell_7_5
        function Cell_7_5ButtonPushed(app, event)
            click_cell(app, app.Cell_7_5, 5, 7);
        end

        % Button pushed function: Cell_7_6
        function Cell_7_6ButtonPushed(app, event)
            click_cell(app, app.Cell_7_6, 6, 7);
        end

        % Button pushed function: Cell_7_7
        function Cell_7_7ButtonPushed(app, event)
            click_cell(app, app.Cell_7_7, 7, 7);
        end

        % Button pushed function: Cell_7_8
        function Cell_7_8ButtonPushed(app, event)
            click_cell(app, app.Cell_7_8, 8 ,7);
        end

        % Button pushed function: Cell_7_9
        function Cell_7_9ButtonPushed(app, event)
            click_cell(app, app.Cell_7_9, 9, 7);
        end

        % Button pushed function: Cell_7_10
        function Cell_7_10ButtonPushed(app, event)
            click_cell(app, app.Cell_7_10, 10, 7);
        end

        % Button pushed function: Cell_7_11
        function Cell_7_11ButtonPushed(app, event)
            click_cell(app, app.Cell_7_11, 11, 7);
        end

        % Button pushed function: Cell_7_12
        function Cell_7_12ButtonPushed(app, event)
            click_cell(app, app.Cell_7_12, 12, 7);
        end

        % Button pushed function: Cell_7_13
        function Cell_7_13ButtonPushed(app, event)
            click_cell(app, app.Cell_7_13, 13, 7);
        end

        % Button pushed function: Cell_7_14
        function Cell_7_14ButtonPushed(app, event)
            click_cell(app, app.Cell_7_14, 14, 7);
        end

        % Button pushed function: Cell_7_15
        function Cell_7_15ButtonPushed(app, event)
            click_cell(app, app.Cell_7_15, 15, 7);
        end

        % Button pushed function: Cell_8_1
        function Cell_8_1ButtonPushed(app, event)
            click_cell(app, app.Cell_8_1, 1, 8);
        end

        % Button pushed function: Cell_8_2
        function Cell_8_2ButtonPushed(app, event)
            click_cell(app, app.Cell_8_2, 2, 8);
        end

        % Button pushed function: Cell_8_3
        function Cell_8_3ButtonPushed(app, event)
            click_cell(app, app.Cell_8_3, 3, 8);
        end

        % Button pushed function: Cell_8_4
        function Cell_8_4ButtonPushed(app, event)
            click_cell(app, app.Cell_8_4, 4, 8);
        end

        % Button pushed function: Cell_8_5
        function Cell_8_5ButtonPushed(app, event)
            click_cell(app, app.Cell_8_5, 5, 8);
        end

        % Button pushed function: Cell_8_6
        function Cell_8_6ButtonPushed(app, event)
            click_cell(app, app.Cell_8_6, 6, 8);
        end

        % Button pushed function: Cell_8_7
        function Cell_8_7ButtonPushed(app, event)
            click_cell(app, app.Cell_8_7, 7, 8);
        end

        % Button pushed function: Cell_8_8
        function Cell_8_8ButtonPushed(app, event)
            click_cell(app, app.Cell_8_8, 8, 8);
        end

        % Button pushed function: Cell_8_9
        function Cell_8_9ButtonPushed(app, event)
            click_cell(app, app.Cell_8_9, 9, 8);
        end

        % Button pushed function: Cell_8_10
        function Cell_8_10ButtonPushed(app, event)
            click_cell(app, app.Cell_8_10, 10, 8);
        end

        % Button pushed function: Cell_8_11
        function Cell_8_11ButtonPushed(app, event)
            click_cell(app, app.Cell_8_11, 11, 8);
        end

        % Button pushed function: Cell_8_12
        function Cell_8_12ButtonPushed(app, event)
            click_cell(app, app.Cell_8_12, 12, 8);
        end

        % Button pushed function: Cell_8_13
        function Cell_8_13ButtonPushed(app, event)
            click_cell(app, app.Cell_8_13, 13, 8);
        end

        % Button pushed function: Cell_8_14
        function Cell_8_14ButtonPushed(app, event)
            click_cell(app, app.Cell_8_14, 14, 8);
        end

        % Button pushed function: Cell_8_15
        function Cell_8_15ButtonPushed(app, event)
            click_cell(app, app.Cell_8_15, 15, 8);
        end

        % Button pushed function: Cell_9_1
        function Cell_9_1ButtonPushed(app, event)
            click_cell(app, app.Cell_9_1, 1, 9);
        end

        % Button pushed function: Cell_9_2
        function Cell_9_2ButtonPushed(app, event)
            click_cell(app, app.Cell_9_2, 2, 9);
        end

        % Button pushed function: Cell_9_3
        function Cell_9_3ButtonPushed(app, event)
            click_cell(app, app.Cell_9_3, 3, 9);
        end

        % Button pushed function: Cell_9_4
        function Cell_9_4ButtonPushed(app, event)
            click_cell(app, app.Cell_9_4, 4, 9);
        end

        % Button pushed function: Cell_9_5
        function Cell_9_5ButtonPushed(app, event)
            click_cell(app, app.Cell_9_5, 5, 9);
        end

        % Button pushed function: Cell_9_6
        function Cell_9_6ButtonPushed(app, event)
            click_cell(app, app.Cell_9_6, 6, 9);
        end

        % Button pushed function: Cell_9_7
        function Cell_9_7ButtonPushed(app, event)
            click_cell(app, app.Cell_9_7, 7, 9);
        end

        % Button pushed function: Cell_9_8
        function Cell_9_8ButtonPushed(app, event)
            click_cell(app, app.Cell_9_8, 8, 9);
        end

        % Button pushed function: Cell_9_9
        function Cell_9_9ButtonPushed(app, event)
            click_cell(app, app.Cell_9_9, 9, 9);
        end

        % Button pushed function: Cell_9_10
        function Cell_9_10ButtonPushed(app, event)
            click_cell(app, app.Cell_9_10, 10, 9);
        end

        % Button pushed function: Cell_9_11
        function Cell_9_11ButtonPushed(app, event)
            click_cell(app, app.Cell_9_11, 11, 9);
        end

        % Button pushed function: Cell_9_12
        function Cell_9_12ButtonPushed(app, event)
            click_cell(app, app.Cell_9_12, 12, 9);
        end

        % Button pushed function: Cell_9_13
        function Cell_9_13ButtonPushed(app, event)
            click_cell(app, app.Cell_9_13, 13, 9);
        end

        % Button pushed function: Cell_9_14
        function Cell_9_14ButtonPushed(app, event)
            click_cell(app, app.Cell_9_14, 14, 9);
        end

        % Button pushed function: Cell_9_15
        function Cell_9_15ButtonPushed(app, event)
            click_cell(app, app.Cell_9_15, 15, 9);
        end

        % Button pushed function: Cell_10_1
        function Cell_10_1ButtonPushed(app, event)
            click_cell(app, app.Cell_10_1, 1, 10);
        end

        % Button pushed function: Cell_10_2
        function Cell_10_2ButtonPushed(app, event)
            click_cell(app, app.Cell_10_2, 2, 10);
        end

        % Button pushed function: Cell_10_3
        function Cell_10_3ButtonPushed(app, event)
            click_cell(app, app.Cell_10_3, 3, 10);
        end

        % Button pushed function: Cell_10_4
        function Cell_10_4ButtonPushed(app, event)
            click_cell(app, app.Cell_10_4, 4, 10);
        end

        % Button pushed function: Cell_10_5
        function Cell_10_5ButtonPushed(app, event)
            click_cell(app, app.Cell_10_5, 5, 10);
        end

        % Button pushed function: Cell_10_6
        function Cell_10_6ButtonPushed(app, event)
            click_cell(app, app.Cell_10_6, 6, 10);
        end

        % Button pushed function: Cell_10_7
        function Cell_10_7ButtonPushed(app, event)
            click_cell(app, app.Cell_10_7, 7, 10);
        end

        % Button pushed function: Cell_10_8
        function Cell_10_8ButtonPushed(app, event)
            click_cell(app, app.Cell_10_8, 8, 10);
        end

        % Button pushed function: Cell_10_9
        function Cell_10_9ButtonPushed(app, event)
            click_cell(app, app.Cell_10_9, 9, 10);
        end

        % Button pushed function: Cell_10_10
        function Cell_10_10ButtonPushed(app, event)
            click_cell(app, app.Cell_10_10, 10, 10);
        end

        % Button pushed function: Cell_10_11
        function Cell_10_11ButtonPushed(app, event)
            click_cell(app, app.Cell_10_11, 11, 10);
        end

        % Button pushed function: Cell_10_12
        function Cell_10_12ButtonPushed(app, event)
            click_cell(app, app.Cell_10_12, 12, 10);
        end

        % Button pushed function: Cell_10_13
        function Cell_10_13ButtonPushed(app, event)
            click_cell(app, app.Cell_10_13, 13, 10);
        end

        % Button pushed function: Cell_10_14
        function Cell_10_14ButtonPushed(app, event)
            click_cell(app, app.Cell_10_14, 14, 10);
        end

        % Button pushed function: Cell_10_15
        function Cell_10_15ButtonPushed(app, event)
            click_cell(app, app.Cell_10_15, 15, 10);
        end

        % Button pushed function: Cell_11_1
        function Cell_11_1ButtonPushed(app, event)
            click_cell(app, app.Cell_11_1, 1, 11);
        end

        % Button pushed function: Cell_11_2
        function Cell_11_2ButtonPushed(app, event)
            click_cell(app, app.Cell_11_2, 2, 11);
        end

        % Button pushed function: Cell_11_3
        function Cell_11_3ButtonPushed(app, event)
            click_cell(app, app.Cell_11_3, 3, 11);
        end

        % Button pushed function: Cell_11_4
        function Cell_11_4ButtonPushed(app, event)
            click_cell(app, app.Cell_11_4, 4, 11);
        end

        % Button pushed function: Cell_11_5
        function Cell_11_5ButtonPushed(app, event)
            click_cell(app, app.Cell_11_5, 5, 11);
        end

        % Button pushed function: Cell_11_6
        function Cell_11_6ButtonPushed(app, event)
            click_cell(app, app.Cell_11_6, 6, 11);
        end

        % Button pushed function: Cell_11_7
        function Cell_11_7ButtonPushed(app, event)
            click_cell(app, app.Cell_11_7, 7, 11);
        end

        % Button pushed function: Cell_11_8
        function Cell_11_8ButtonPushed(app, event)
            click_cell(app, app.Cell_11_8, 8, 11);
        end

        % Button pushed function: Cell_11_9
        function Cell_11_9ButtonPushed(app, event)
            click_cell(app, app.Cell_11_9, 9, 11);
        end

        % Button pushed function: Cell_11_10
        function Cell_11_10ButtonPushed(app, event)
            click_cell(app, app.Cell_11_10, 10, 11);
        end

        % Button pushed function: Cell_11_11
        function Cell_11_11ButtonPushed(app, event)
            click_cell(app, app.Cell_11_11, 11, 11);
        end

        % Button pushed function: Cell_11_12
        function Cell_11_12ButtonPushed(app, event)
            click_cell(app, app.Cell_11_12, 12, 11);
        end

        % Button pushed function: Cell_11_13
        function Cell_11_13ButtonPushed(app, event)
            click_cell(app, app.Cell_11_13, 13, 11);
        end

        % Button pushed function: Cell_11_14
        function Cell_11_14ButtonPushed(app, event)
            click_cell(app, app.Cell_11_14, 14, 11);
        end

        % Button pushed function: Cell_11_15
        function Cell_11_15ButtonPushed(app, event)
            click_cell(app, app.Cell_11_15, 15, 11);
        end

        % Button pushed function: Cell_12_1
        function Cell_12_1ButtonPushed(app, event)
            click_cell(app, app.Cell_12_1, 1, 12);
        end

        % Button pushed function: Cell_12_2
        function Cell_12_2ButtonPushed(app, event)
            click_cell(app, app.Cell_12_2, 2, 12);
        end

        % Button pushed function: Cell_12_3
        function Cell_12_3ButtonPushed(app, event)
            click_cell(app, app.Cell_12_3, 3, 12);
        end

        % Button pushed function: Cell_12_4
        function Cell_12_4ButtonPushed(app, event)
            click_cell(app, app.Cell_12_4, 4, 12);
        end

        % Button pushed function: Cell_12_5
        function Cell_12_5ButtonPushed(app, event)
            click_cell(app, app.Cell_12_5, 5, 12);
        end

        % Button pushed function: Cell_12_6
        function Cell_12_6ButtonPushed(app, event)
            click_cell(app, app.Cell_12_6, 6, 12);
        end

        % Button pushed function: Cell_12_7
        function Cell_12_7ButtonPushed(app, event)
            click_cell(app, app.Cell_12_7, 7, 12);
        end

        % Button pushed function: Cell_12_8
        function Cell_12_8ButtonPushed(app, event)
            click_cell(app, app.Cell_12_8, 8, 12);
        end

        % Button pushed function: Cell_12_9
        function Cell_12_9ButtonPushed(app, event)
            click_cell(app, app.Cell_12_9, 9, 12);
        end

        % Button pushed function: Cell_12_10
        function Cell_12_10ButtonPushed(app, event)
            click_cell(app, app.Cell_12_10, 10, 12);
        end

        % Button pushed function: Cell_12_11
        function Cell_12_11ButtonPushed(app, event)
            click_cell(app, app.Cell_12_11, 11, 12);
        end

        % Button pushed function: Cell_12_12
        function Cell_12_12ButtonPushed(app, event)
            click_cell(app, app.Cell_12_12, 12, 12);
        end

        % Button pushed function: Cell_12_13
        function Cell_12_13ButtonPushed(app, event)
            click_cell(app, app.Cell_12_13, 13, 12);
        end

        % Button pushed function: Cell_12_14
        function Cell_12_14ButtonPushed(app, event)
            click_cell(app, app.Cell_12_14, 14, 12);
        end

        % Button pushed function: Cell_12_15
        function Cell_12_15ButtonPushed(app, event)
            click_cell(app, app.Cell_12_15, 15, 12);
        end

        % Button pushed function: Cell_13_1
        function Cell_13_1ButtonPushed(app, event)
            click_cell(app, app.Cell_13_1, 1, 13);
        end

        % Button pushed function: Cell_13_2
        function Cell_13_2ButtonPushed(app, event)
            click_cell(app, app.Cell_13_2, 2, 13);
        end

        % Button pushed function: Cell_13_3
        function Cell_13_3ButtonPushed(app, event)
            click_cell(app, app.Cell_13_3, 3, 13);
        end

        % Button pushed function: Cell_13_4
        function Cell_13_4ButtonPushed(app, event)
            click_cell(app, app.Cell_13_4, 4, 13);
        end

        % Button pushed function: Cell_13_5
        function Cell_13_5ButtonPushed(app, event)
            click_cell(app, app.Cell_13_5, 5, 13);
        end

        % Button pushed function: Cell_13_6
        function Cell_13_6ButtonPushed(app, event)
            click_cell(app, app.Cell_13_6, 6, 13);
        end

        % Button pushed function: Cell_13_7
        function Cell_13_7ButtonPushed(app, event)
            click_cell(app, app.Cell_13_7, 7, 13);
        end

        % Button pushed function: Cell_13_8
        function Cell_13_8ButtonPushed(app, event)
            click_cell(app, app.Cell_13_8, 8, 13);
        end

        % Button pushed function: Cell_13_9
        function Cell_13_9ButtonPushed(app, event)
            click_cell(app, app.Cell_13_9, 9, 13);
        end

        % Button pushed function: Cell_13_10
        function Cell_13_10ButtonPushed(app, event)
            click_cell(app, app.Cell_13_10, 10, 13);
        end

        % Button pushed function: Cell_13_11
        function Cell_13_11ButtonPushed(app, event)
            click_cell(app, app.Cell_13_11, 11, 13);
        end

        % Button pushed function: Cell_13_12
        function Cell_13_12ButtonPushed(app, event)
            click_cell(app, app.Cell_13_12, 12, 13);
        end

        % Button pushed function: Cell_13_13
        function Cell_13_13ButtonPushed(app, event)
            click_cell(app, app.Cell_13_13, 13, 13);
        end

        % Button pushed function: Cell_13_14
        function Cell_13_14ButtonPushed(app, event)
            click_cell(app, app.Cell_13_14, 14, 13);
        end

        % Button pushed function: Cell_13_15
        function Cell_13_15ButtonPushed(app, event)
            click_cell(app, app.Cell_13_15, 15, 13);
        end

        % Button pushed function: Cell_14_1
        function Cell_14_1ButtonPushed(app, event)
            click_cell(app, app.Cell_14_1, 1, 14);
        end

        % Button pushed function: Cell_14_2
        function Cell_14_2ButtonPushed(app, event)
            click_cell(app, app.Cell_14_2, 2, 14);
        end

        % Button pushed function: Cell_14_3
        function Cell_14_3ButtonPushed(app, event)
            click_cell(app, app.Cell_14_3, 3, 14);
        end

        % Button pushed function: Cell_14_4
        function Cell_14_4ButtonPushed(app, event)
            click_cell(app, app.Cell_14_4, 4, 14);
        end

        % Button pushed function: Cell_14_5
        function Cell_14_5ButtonPushed(app, event)
            click_cell(app, app.Cell_14_5, 5, 14);
        end

        % Button pushed function: Cell_14_6
        function Cell_14_6ButtonPushed(app, event)
            click_cell(app, app.Cell_14_6, 6, 14);
        end

        % Button pushed function: Cell_14_7
        function Cell_14_7ButtonPushed(app, event)
            click_cell(app, app.Cell_14_7, 7, 14);
        end

        % Button pushed function: Cell_14_8
        function Cell_14_8ButtonPushed(app, event)
            click_cell(app, app.Cell_14_8, 8, 14);
        end

        % Button pushed function: Cell_14_9
        function Cell_14_9ButtonPushed(app, event)
            click_cell(app, app.Cell_14_9, 9, 14);
        end

        % Button pushed function: Cell_14_10
        function Cell_14_10ButtonPushed(app, event)
            click_cell(app, app.Cell_14_10, 10, 14);
        end

        % Button pushed function: Cell_14_11
        function Cell_14_11ButtonPushed(app, event)
            click_cell(app, app.Cell_14_11, 11, 14);
        end

        % Button pushed function: Cell_14_12
        function Cell_14_12ButtonPushed(app, event)
            click_cell(app, app.Cell_14_12, 12, 14);
        end

        % Button pushed function: Cell_14_13
        function Cell_14_13ButtonPushed(app, event)
            click_cell(app, app.Cell_14_13, 13, 14);
        end

        % Button pushed function: Cell_14_14
        function Cell_14_14ButtonPushed(app, event)
            click_cell(app, app.Cell_14_14, 14, 14);
        end

        % Button pushed function: Cell_14_15
        function Cell_14_15ButtonPushed(app, event)
            click_cell(app, app.Cell_14_15, 15, 14);
        end

        % Button pushed function: Cell_15_1
        function Cell_15_1ButtonPushed(app, event)
            click_cell(app, app.Cell_15_1, 1, 15);
        end

        % Button pushed function: Cell_15_2
        function Cell_15_2ButtonPushed(app, event)
            click_cell(app, app.Cell_15_2, 2, 15);
        end

        % Button pushed function: Cell_15_3
        function Cell_15_3ButtonPushed(app, event)
            click_cell(app, app.Cell_15_3, 3, 15);
        end

        % Button pushed function: Cell_15_4
        function Cell_15_4ButtonPushed(app, event)
            click_cell(app, app.Cell_15_4, 4, 15);
        end

        % Button pushed function: Cell_15_5
        function Cell_15_5ButtonPushed(app, event)
            click_cell(app, app.Cell_15_5, 5, 15);
        end

        % Button pushed function: Cell_15_6
        function Cell_15_6ButtonPushed(app, event)
            click_cell(app, app.Cell_15_6, 6, 15);
        end

        % Button pushed function: Cell_15_7
        function Cell_15_7ButtonPushed(app, event)
            click_cell(app, app.Cell_15_7, 7, 15);
        end

        % Button pushed function: Cell_15_8
        function Cell_15_8ButtonPushed(app, event)
            click_cell(app, app.Cell_15_8, 8, 15);
        end

        % Button pushed function: Cell_15_9
        function Cell_15_9ButtonPushed(app, event)
            click_cell(app, app.Cell_15_9, 9, 15);
        end

        % Button pushed function: Cell_15_10
        function Cell_15_10ButtonPushed(app, event)
            click_cell(app, app.Cell_15_10, 10, 15);
        end

        % Button pushed function: Cell_15_11
        function Cell_15_11ButtonPushed(app, event)
            click_cell(app, app.Cell_15_11, 11, 15);
        end

        % Button pushed function: Cell_15_12
        function Cell_15_12ButtonPushed(app, event)
            click_cell(app, app.Cell_15_12, 12, 15);
        end

        % Button pushed function: Cell_15_13
        function Cell_15_13ButtonPushed(app, event)
            click_cell(app, app.Cell_15_13, 13, 15);
        end

        % Button pushed function: Cell_15_14
        function Cell_15_14ButtonPushed(app, event)
            click_cell(app, app.Cell_15_14, 14, 15);
        end

        % Button pushed function: Cell_15_15
        function Cell_15_15ButtonPushed(app, event)
            click_cell(app, app.Cell_15_15, 15, 15);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 320 399];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';

            % Create RestartButton
            app.RestartButton = uibutton(app.UIFigure, 'push');
            app.RestartButton.ButtonPushedFcn = ...
                createCallbackFcn(app, @RestartButtonPushed, true);
            app.RestartButton.Icon = 'restart_button.jpg';
            app.RestartButton.Position = [171 320 40 40];
            app.RestartButton.Text = '';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.UIFigure);
            app.ButtonGroup.AutoResizeChildren = 'off';
            app.ButtonGroup.SelectionChangedFcn = ...
                createCallbackFcn(app, @ButtonGroupSelectionChanged, true);
            app.ButtonGroup.Position = [11 320 40 40];

            % Create CursorButton
            app.CursorButton = uiradiobutton(app.ButtonGroup);
            app.CursorButton.Text = '';
            app.CursorButton.Position = [1 17 20 22];
            app.CursorButton.Value = true;

            % Create FlagButton
            app.FlagButton = uiradiobutton(app.ButtonGroup);
            app.FlagButton.Text = '';
            app.FlagButton.Position = [1 -3 20 22];

            % Create FlagImage
            app.FlagImage = uiimage(app.ButtonGroup);
            app.FlagImage.Position = [21 -1 20 20];
            app.FlagImage.ImageSource = 'flag_button.jpg';

            % Create CursorImage
            app.CursorImage = uiimage(app.ButtonGroup);
            app.CursorImage.Position = [20 20 20 20];
            app.CursorImage.ImageSource = 'cursor_button.png';

            % Create LevelChoice
            app.LevelChoice = uidropdown(app.UIFigure);
            app.LevelChoice.Items = {'Easy', 'Medium', 'Hard'};
            app.LevelChoice.ValueChangedFcn = ...
                createCallbackFcn(app, @LevelChoiceValueChanged, true);
            app.LevelChoice.Position = [71 320 80 40];
            app.LevelChoice.Value = 'Medium';

            % Create MinesLeft1
            app.MinesLeft1 = uiimage(app.UIFigure);
            app.MinesLeft1.Position = [231 320 40 40];

            % Create MinesLeft2
            app.MinesLeft2 = uiimage(app.UIFigure);
            app.MinesLeft2.Position = [271 320 40 40];

            % Create Field
            app.Field = uibuttongroup(app.UIFigure);
            app.Field.AutoResizeChildren = 'off';
            app.Field.Position = [11 10 300 300];

            % Create Cell_1_1
            app.Cell_1_1 = uibutton(app.Field, 'push');
            app.Cell_1_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_1ButtonPushed, true);
            app.Cell_1_1.Position = [0 280 20 20];
            app.Cell_1_1.Text = '';

            % Create Cell_1_2
            app.Cell_1_2 = uibutton(app.Field, 'push');
            app.Cell_1_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_2ButtonPushed, true);
            app.Cell_1_2.Position = [20 280 20 20];
            app.Cell_1_2.Text = '';

            % Create Cell_1_3
            app.Cell_1_3 = uibutton(app.Field, 'push');
            app.Cell_1_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_3ButtonPushed, true);
            app.Cell_1_3.Position = [40 280 20 20];
            app.Cell_1_3.Text = '';

            % Create Cell_1_4
            app.Cell_1_4 = uibutton(app.Field, 'push');
            app.Cell_1_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_4ButtonPushed, true);
            app.Cell_1_4.Position = [60 280 20 20];
            app.Cell_1_4.Text = '';

            % Create Cell_1_5
            app.Cell_1_5 = uibutton(app.Field, 'push');
            app.Cell_1_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_5ButtonPushed, true);
            app.Cell_1_5.Position = [80 280 20 20];
            app.Cell_1_5.Text = '';

            % Create Cell_1_6
            app.Cell_1_6 = uibutton(app.Field, 'push');
            app.Cell_1_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_6ButtonPushed, true);
            app.Cell_1_6.Position = [100 280 20 20];
            app.Cell_1_6.Text = '';

            % Create Cell_1_7
            app.Cell_1_7 = uibutton(app.Field, 'push');
            app.Cell_1_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_7ButtonPushed, true);
            app.Cell_1_7.Position = [120 280 20 20];
            app.Cell_1_7.Text = '';

            % Create Cell_1_8
            app.Cell_1_8 = uibutton(app.Field, 'push');
            app.Cell_1_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_8ButtonPushed, true);
            app.Cell_1_8.Position = [140 280 20 20];
            app.Cell_1_8.Text = '';

            % Create Cell_1_9
            app.Cell_1_9 = uibutton(app.Field, 'push');
            app.Cell_1_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_9ButtonPushed, true);
            app.Cell_1_9.Position = [160 280 20 20];
            app.Cell_1_9.Text = '';

            % Create Cell_1_10
            app.Cell_1_10 = uibutton(app.Field, 'push');
            app.Cell_1_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_10ButtonPushed, true);
            app.Cell_1_10.Position = [180 280 20 20];
            app.Cell_1_10.Text = '';

            % Create Cell_1_11
            app.Cell_1_11 = uibutton(app.Field, 'push');
            app.Cell_1_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_11ButtonPushed, true);
            app.Cell_1_11.Position = [200 280 20 20];
            app.Cell_1_11.Text = '';

            % Create Cell_1_12
            app.Cell_1_12 = uibutton(app.Field, 'push');
            app.Cell_1_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_12ButtonPushed, true);
            app.Cell_1_12.Position = [220 280 20 20];
            app.Cell_1_12.Text = '';

            % Create Cell_1_13
            app.Cell_1_13 = uibutton(app.Field, 'push');
            app.Cell_1_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_13ButtonPushed, true);
            app.Cell_1_13.Position = [240 280 20 20];
            app.Cell_1_13.Text = '';

            % Create Cell_1_14
            app.Cell_1_14 = uibutton(app.Field, 'push');
            app.Cell_1_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_14ButtonPushed, true);
            app.Cell_1_14.Position = [260 280 20 20];
            app.Cell_1_14.Text = '';

            % Create Cell_1_15
            app.Cell_1_15 = uibutton(app.Field, 'push');
            app.Cell_1_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_1_15ButtonPushed, true);
            app.Cell_1_15.Position = [280 280 20 20];
            app.Cell_1_15.Text = '';

            % Create Cell_2_1
            app.Cell_2_1 = uibutton(app.Field, 'push');
            app.Cell_2_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_1ButtonPushed, true);
            app.Cell_2_1.Position = [0 260 20 20];
            app.Cell_2_1.Text = '';

            % Create Cell_2_2
            app.Cell_2_2 = uibutton(app.Field, 'push');
            app.Cell_2_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_2ButtonPushed, true);
            app.Cell_2_2.Position = [20 260 20 20];
            app.Cell_2_2.Text = '';

            % Create Cell_2_3
            app.Cell_2_3 = uibutton(app.Field, 'push');
            app.Cell_2_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_3ButtonPushed, true);
            app.Cell_2_3.Position = [40 260 20 20];
            app.Cell_2_3.Text = '';

            % Create Cell_2_4
            app.Cell_2_4 = uibutton(app.Field, 'push');
            app.Cell_2_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_4ButtonPushed, true);
            app.Cell_2_4.Position = [60 260 20 20];
            app.Cell_2_4.Text = '';

            % Create Cell_2_5
            app.Cell_2_5 = uibutton(app.Field, 'push');
            app.Cell_2_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_5ButtonPushed, true);
            app.Cell_2_5.Position = [80 260 20 20];
            app.Cell_2_5.Text = '';

            % Create Cell_2_6
            app.Cell_2_6 = uibutton(app.Field, 'push');
            app.Cell_2_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_6ButtonPushed, true);
            app.Cell_2_6.Position = [100 260 20 20];
            app.Cell_2_6.Text = '';

            % Create Cell_2_7
            app.Cell_2_7 = uibutton(app.Field, 'push');
            app.Cell_2_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_7ButtonPushed, true);
            app.Cell_2_7.Position = [120 260 20 20];
            app.Cell_2_7.Text = '';

            % Create Cell_2_8
            app.Cell_2_8 = uibutton(app.Field, 'push');
            app.Cell_2_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_8ButtonPushed, true);
            app.Cell_2_8.Position = [140 260 20 20];
            app.Cell_2_8.Text = '';

            % Create Cell_2_9
            app.Cell_2_9 = uibutton(app.Field, 'push');
            app.Cell_2_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_9ButtonPushed, true);
            app.Cell_2_9.Position = [160 260 20 20];
            app.Cell_2_9.Text = '';

            % Create Cell_2_10
            app.Cell_2_10 = uibutton(app.Field, 'push');
            app.Cell_2_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_10ButtonPushed, true);
            app.Cell_2_10.Position = [180 260 20 20];
            app.Cell_2_10.Text = '';

            % Create Cell_2_11
            app.Cell_2_11 = uibutton(app.Field, 'push');
            app.Cell_2_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_11ButtonPushed, true);
            app.Cell_2_11.Position = [200 260 20 20];
            app.Cell_2_11.Text = '';

            % Create Cell_2_12
            app.Cell_2_12 = uibutton(app.Field, 'push');
            app.Cell_2_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_12ButtonPushed, true);
            app.Cell_2_12.Position = [220 260 20 20];
            app.Cell_2_12.Text = '';

            % Create Cell_2_13
            app.Cell_2_13 = uibutton(app.Field, 'push');
            app.Cell_2_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_13ButtonPushed, true);
            app.Cell_2_13.Position = [240 260 20 20];
            app.Cell_2_13.Text = '';

            % Create Cell_2_14
            app.Cell_2_14 = uibutton(app.Field, 'push');
            app.Cell_2_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_14ButtonPushed, true);
            app.Cell_2_14.Position = [260 260 20 20];
            app.Cell_2_14.Text = '';

            % Create Cell_2_15
            app.Cell_2_15 = uibutton(app.Field, 'push');
            app.Cell_2_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_2_15ButtonPushed, true);
            app.Cell_2_15.Position = [280 260 20 20];
            app.Cell_2_15.Text = '';

            % Create Cell_3_1
            app.Cell_3_1 = uibutton(app.Field, 'push');
            app.Cell_3_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_1ButtonPushed, true);
            app.Cell_3_1.Position = [0 240 20 20];
            app.Cell_3_1.Text = '';

            % Create Cell_3_2
            app.Cell_3_2 = uibutton(app.Field, 'push');
            app.Cell_3_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_2ButtonPushed, true);
            app.Cell_3_2.Position = [20 240 20 20];
            app.Cell_3_2.Text = '';

            % Create Cell_3_3
            app.Cell_3_3 = uibutton(app.Field, 'push');
            app.Cell_3_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_3ButtonPushed, true);
            app.Cell_3_3.Position = [40 240 20 20];
            app.Cell_3_3.Text = '';

            % Create Cell_3_4
            app.Cell_3_4 = uibutton(app.Field, 'push');
            app.Cell_3_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_4ButtonPushed, true);
            app.Cell_3_4.Position = [60 240 20 20];
            app.Cell_3_4.Text = '';

            % Create Cell_3_5
            app.Cell_3_5 = uibutton(app.Field, 'push');
            app.Cell_3_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_5ButtonPushed, true);
            app.Cell_3_5.Position = [80 240 20 20];
            app.Cell_3_5.Text = '';

            % Create Cell_3_6
            app.Cell_3_6 = uibutton(app.Field, 'push');
            app.Cell_3_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_6ButtonPushed, true);
            app.Cell_3_6.Position = [100 240 20 20];
            app.Cell_3_6.Text = '';

            % Create Cell_3_7
            app.Cell_3_7 = uibutton(app.Field, 'push');
            app.Cell_3_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_7ButtonPushed, true);
            app.Cell_3_7.Position = [120 240 20 20];
            app.Cell_3_7.Text = '';

            % Create Cell_3_8
            app.Cell_3_8 = uibutton(app.Field, 'push');
            app.Cell_3_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_8ButtonPushed, true);
            app.Cell_3_8.Position = [140 240 20 20];
            app.Cell_3_8.Text = '';

            % Create Cell_3_9
            app.Cell_3_9 = uibutton(app.Field, 'push');
            app.Cell_3_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_9ButtonPushed, true);
            app.Cell_3_9.Position = [160 240 20 20];
            app.Cell_3_9.Text = '';

            % Create Cell_3_10
            app.Cell_3_10 = uibutton(app.Field, 'push');
            app.Cell_3_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_10ButtonPushed, true);
            app.Cell_3_10.Position = [180 240 20 20];
            app.Cell_3_10.Text = '';

            % Create Cell_3_11
            app.Cell_3_11 = uibutton(app.Field, 'push');
            app.Cell_3_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_11ButtonPushed, true);
            app.Cell_3_11.Position = [200 240 20 20];
            app.Cell_3_11.Text = '';

            % Create Cell_3_12
            app.Cell_3_12 = uibutton(app.Field, 'push');
            app.Cell_3_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_12ButtonPushed, true);
            app.Cell_3_12.Position = [220 240 20 20];
            app.Cell_3_12.Text = '';

            % Create Cell_3_13
            app.Cell_3_13 = uibutton(app.Field, 'push');
            app.Cell_3_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_13ButtonPushed, true);
            app.Cell_3_13.Position = [240 240 20 20];
            app.Cell_3_13.Text = '';

            % Create Cell_3_14
            app.Cell_3_14 = uibutton(app.Field, 'push');
            app.Cell_3_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_14ButtonPushed, true);
            app.Cell_3_14.Position = [260 240 20 20];
            app.Cell_3_14.Text = '';

            % Create Cell_3_15
            app.Cell_3_15 = uibutton(app.Field, 'push');
            app.Cell_3_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_3_15ButtonPushed, true);
            app.Cell_3_15.Position = [280 240 20 20];
            app.Cell_3_15.Text = '';

            % Create Cell_4_1
            app.Cell_4_1 = uibutton(app.Field, 'push');
            app.Cell_4_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_1ButtonPushed, true);
            app.Cell_4_1.Position = [0 220 20 20];
            app.Cell_4_1.Text = '';

            % Create Cell_4_2
            app.Cell_4_2 = uibutton(app.Field, 'push');
            app.Cell_4_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_2ButtonPushed, true);
            app.Cell_4_2.Position = [20 220 20 20];
            app.Cell_4_2.Text = '';

            % Create Cell_4_3
            app.Cell_4_3 = uibutton(app.Field, 'push');
            app.Cell_4_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_3ButtonPushed, true);
            app.Cell_4_3.Position = [40 220 20 20];
            app.Cell_4_3.Text = '';

            % Create Cell_4_4
            app.Cell_4_4 = uibutton(app.Field, 'push');
            app.Cell_4_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_4ButtonPushed, true);
            app.Cell_4_4.Position = [60 220 20 20];
            app.Cell_4_4.Text = '';

            % Create Cell_4_5
            app.Cell_4_5 = uibutton(app.Field, 'push');
            app.Cell_4_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_5ButtonPushed, true);
            app.Cell_4_5.Position = [80 220 20 20];
            app.Cell_4_5.Text = '';

            % Create Cell_4_6
            app.Cell_4_6 = uibutton(app.Field, 'push');
            app.Cell_4_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_6ButtonPushed, true);
            app.Cell_4_6.Position = [100 220 20 20];
            app.Cell_4_6.Text = '';

            % Create Cell_4_7
            app.Cell_4_7 = uibutton(app.Field, 'push');
            app.Cell_4_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_7ButtonPushed, true);
            app.Cell_4_7.Position = [120 220 20 20];
            app.Cell_4_7.Text = '';

            % Create Cell_4_8
            app.Cell_4_8 = uibutton(app.Field, 'push');
            app.Cell_4_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_8ButtonPushed, true);
            app.Cell_4_8.Position = [140 220 20 20];
            app.Cell_4_8.Text = '';

            % Create Cell_4_9
            app.Cell_4_9 = uibutton(app.Field, 'push');
            app.Cell_4_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_9ButtonPushed, true);
            app.Cell_4_9.Position = [160 220 20 20];
            app.Cell_4_9.Text = '';

            % Create Cell_4_10
            app.Cell_4_10 = uibutton(app.Field, 'push');
            app.Cell_4_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_10ButtonPushed, true);
            app.Cell_4_10.Position = [180 220 20 20];
            app.Cell_4_10.Text = '';

            % Create Cell_4_11
            app.Cell_4_11 = uibutton(app.Field, 'push');
            app.Cell_4_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_11ButtonPushed, true);
            app.Cell_4_11.Position = [200 220 20 20];
            app.Cell_4_11.Text = '';

            % Create Cell_4_12
            app.Cell_4_12 = uibutton(app.Field, 'push');
            app.Cell_4_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_12ButtonPushed, true);
            app.Cell_4_12.Position = [220 220 20 20];
            app.Cell_4_12.Text = '';

            % Create Cell_4_13
            app.Cell_4_13 = uibutton(app.Field, 'push');
            app.Cell_4_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_13ButtonPushed, true);
            app.Cell_4_13.Position = [240 220 20 20];
            app.Cell_4_13.Text = '';

            % Create Cell_4_14
            app.Cell_4_14 = uibutton(app.Field, 'push');
            app.Cell_4_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_14ButtonPushed, true);
            app.Cell_4_14.Position = [260 220 20 20];
            app.Cell_4_14.Text = '';

            % Create Cell_4_15
            app.Cell_4_15 = uibutton(app.Field, 'push');
            app.Cell_4_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_4_15ButtonPushed, true);
            app.Cell_4_15.Position = [280 220 20 20];
            app.Cell_4_15.Text = '';

            % Create Cell_5_1
            app.Cell_5_1 = uibutton(app.Field, 'push');
            app.Cell_5_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_1ButtonPushed, true);
            app.Cell_5_1.Position = [0 200 20 20];
            app.Cell_5_1.Text = '';

            % Create Cell_5_2
            app.Cell_5_2 = uibutton(app.Field, 'push');
            app.Cell_5_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_2ButtonPushed, true);
            app.Cell_5_2.Position = [20 200 20 20];
            app.Cell_5_2.Text = '';

            % Create Cell_5_3
            app.Cell_5_3 = uibutton(app.Field, 'push');
            app.Cell_5_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_3ButtonPushed, true);
            app.Cell_5_3.Position = [40 200 20 20];
            app.Cell_5_3.Text = '';

            % Create Cell_5_4
            app.Cell_5_4 = uibutton(app.Field, 'push');
            app.Cell_5_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_4ButtonPushed, true);
            app.Cell_5_4.Position = [60 200 20 20];
            app.Cell_5_4.Text = '';

            % Create Cell_5_5
            app.Cell_5_5 = uibutton(app.Field, 'push');
            app.Cell_5_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_5ButtonPushed, true);
            app.Cell_5_5.Position = [80 200 20 20];
            app.Cell_5_5.Text = '';

            % Create Cell_5_6
            app.Cell_5_6 = uibutton(app.Field, 'push');
            app.Cell_5_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_6ButtonPushed, true);
            app.Cell_5_6.Position = [100 200 20 20];
            app.Cell_5_6.Text = '';

            % Create Cell_5_7
            app.Cell_5_7 = uibutton(app.Field, 'push');
            app.Cell_5_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_7ButtonPushed, true);
            app.Cell_5_7.Position = [120 200 20 20];
            app.Cell_5_7.Text = '';

            % Create Cell_5_8
            app.Cell_5_8 = uibutton(app.Field, 'push');
            app.Cell_5_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_8ButtonPushed, true);
            app.Cell_5_8.Position = [140 200 20 20];
            app.Cell_5_8.Text = '';

            % Create Cell_5_9
            app.Cell_5_9 = uibutton(app.Field, 'push');
            app.Cell_5_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_9ButtonPushed, true);
            app.Cell_5_9.Position = [160 200 20 20];
            app.Cell_5_9.Text = '';

            % Create Cell_5_10
            app.Cell_5_10 = uibutton(app.Field, 'push');
            app.Cell_5_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_10ButtonPushed, true);
            app.Cell_5_10.Position = [180 200 20 20];
            app.Cell_5_10.Text = '';

            % Create Cell_5_11
            app.Cell_5_11 = uibutton(app.Field, 'push');
            app.Cell_5_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_11ButtonPushed, true);
            app.Cell_5_11.Position = [200 200 20 20];
            app.Cell_5_11.Text = '';

            % Create Cell_5_12
            app.Cell_5_12 = uibutton(app.Field, 'push');
            app.Cell_5_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_12ButtonPushed, true);
            app.Cell_5_12.Position = [220 200 20 20];
            app.Cell_5_12.Text = '';

            % Create Cell_5_13
            app.Cell_5_13 = uibutton(app.Field, 'push');
            app.Cell_5_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_13ButtonPushed, true);
            app.Cell_5_13.Position = [240 200 20 20];
            app.Cell_5_13.Text = '';

            % Create Cell_5_14
            app.Cell_5_14 = uibutton(app.Field, 'push');
            app.Cell_5_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_14ButtonPushed, true);
            app.Cell_5_14.Position = [260 200 20 20];
            app.Cell_5_14.Text = '';

            % Create Cell_5_15
            app.Cell_5_15 = uibutton(app.Field, 'push');
            app.Cell_5_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_5_15ButtonPushed, true);
            app.Cell_5_15.Position = [280 200 20 20];
            app.Cell_5_15.Text = '';

            % Create Cell_6_1
            app.Cell_6_1 = uibutton(app.Field, 'push');
            app.Cell_6_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_1ButtonPushed, true);
            app.Cell_6_1.Position = [0 180 20 20];
            app.Cell_6_1.Text = '';

            % Create Cell_6_2
            app.Cell_6_2 = uibutton(app.Field, 'push');
            app.Cell_6_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_2ButtonPushed, true);
            app.Cell_6_2.Position = [20 180 20 20];
            app.Cell_6_2.Text = '';

            % Create Cell_6_3
            app.Cell_6_3 = uibutton(app.Field, 'push');
            app.Cell_6_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_3ButtonPushed, true);
            app.Cell_6_3.Position = [40 180 20 20];
            app.Cell_6_3.Text = '';

            % Create Cell_6_4
            app.Cell_6_4 = uibutton(app.Field, 'push');
            app.Cell_6_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_4ButtonPushed, true);
            app.Cell_6_4.Position = [60 180 20 20];
            app.Cell_6_4.Text = '';

            % Create Cell_6_5
            app.Cell_6_5 = uibutton(app.Field, 'push');
            app.Cell_6_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_5ButtonPushed, true);
            app.Cell_6_5.Position = [80 180 20 20];
            app.Cell_6_5.Text = '';

            % Create Cell_6_6
            app.Cell_6_6 = uibutton(app.Field, 'push');
            app.Cell_6_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_6ButtonPushed, true);
            app.Cell_6_6.Position = [100 180 20 20];
            app.Cell_6_6.Text = '';

            % Create Cell_6_7
            app.Cell_6_7 = uibutton(app.Field, 'push');
            app.Cell_6_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_7ButtonPushed, true);
            app.Cell_6_7.Position = [120 180 20 20];
            app.Cell_6_7.Text = '';

            % Create Cell_6_8
            app.Cell_6_8 = uibutton(app.Field, 'push');
            app.Cell_6_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_8ButtonPushed, true);
            app.Cell_6_8.Position = [140 180 20 20];
            app.Cell_6_8.Text = '';

            % Create Cell_6_9
            app.Cell_6_9 = uibutton(app.Field, 'push');
            app.Cell_6_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_9ButtonPushed, true);
            app.Cell_6_9.Position = [160 180 20 20];
            app.Cell_6_9.Text = '';

            % Create Cell_6_10
            app.Cell_6_10 = uibutton(app.Field, 'push');
            app.Cell_6_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_10ButtonPushed, true);
            app.Cell_6_10.Position = [180 180 20 20];
            app.Cell_6_10.Text = '';

            % Create Cell_6_11
            app.Cell_6_11 = uibutton(app.Field, 'push');
            app.Cell_6_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_11ButtonPushed, true);
            app.Cell_6_11.Position = [200 180 20 20];
            app.Cell_6_11.Text = '';

            % Create Cell_6_12
            app.Cell_6_12 = uibutton(app.Field, 'push');
            app.Cell_6_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_12ButtonPushed, true);
            app.Cell_6_12.Position = [220 180 20 20];
            app.Cell_6_12.Text = '';

            % Create Cell_6_13
            app.Cell_6_13 = uibutton(app.Field, 'push');
            app.Cell_6_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_13ButtonPushed, true);
            app.Cell_6_13.Position = [240 180 20 20];
            app.Cell_6_13.Text = '';

            % Create Cell_6_14
            app.Cell_6_14 = uibutton(app.Field, 'push');
            app.Cell_6_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_14ButtonPushed, true);
            app.Cell_6_14.Position = [260 180 20 20];
            app.Cell_6_14.Text = '';

            % Create Cell_6_15
            app.Cell_6_15 = uibutton(app.Field, 'push');
            app.Cell_6_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_6_15ButtonPushed, true);
            app.Cell_6_15.Position = [280 180 20 20];
            app.Cell_6_15.Text = '';

            % Create Cell_7_1
            app.Cell_7_1 = uibutton(app.Field, 'push');
            app.Cell_7_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_1ButtonPushed, true);
            app.Cell_7_1.Position = [0 160 20 20];
            app.Cell_7_1.Text = '';

            % Create Cell_7_2
            app.Cell_7_2 = uibutton(app.Field, 'push');
            app.Cell_7_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_2ButtonPushed, true);
            app.Cell_7_2.Position = [20 160 20 20];
            app.Cell_7_2.Text = '';

            % Create Cell_7_3
            app.Cell_7_3 = uibutton(app.Field, 'push');
            app.Cell_7_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_3ButtonPushed, true);
            app.Cell_7_3.Position = [40 160 20 20];
            app.Cell_7_3.Text = '';

            % Create Cell_7_4
            app.Cell_7_4 = uibutton(app.Field, 'push');
            app.Cell_7_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_4ButtonPushed, true);
            app.Cell_7_4.Position = [60 160 20 20];
            app.Cell_7_4.Text = '';

            % Create Cell_7_5
            app.Cell_7_5 = uibutton(app.Field, 'push');
            app.Cell_7_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_5ButtonPushed, true);
            app.Cell_7_5.Position = [80 160 20 20];
            app.Cell_7_5.Text = '';

            % Create Cell_7_6
            app.Cell_7_6 = uibutton(app.Field, 'push');
            app.Cell_7_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_6ButtonPushed, true);
            app.Cell_7_6.Position = [100 160 20 20];
            app.Cell_7_6.Text = '';

            % Create Cell_7_7
            app.Cell_7_7 = uibutton(app.Field, 'push');
            app.Cell_7_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_7ButtonPushed, true);
            app.Cell_7_7.Position = [120 160 20 20];
            app.Cell_7_7.Text = '';

            % Create Cell_7_8
            app.Cell_7_8 = uibutton(app.Field, 'push');
            app.Cell_7_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_8ButtonPushed, true);
            app.Cell_7_8.Position = [140 160 20 20];
            app.Cell_7_8.Text = '';

            % Create Cell_7_9
            app.Cell_7_9 = uibutton(app.Field, 'push');
            app.Cell_7_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_9ButtonPushed, true);
            app.Cell_7_9.Position = [160 160 20 20];
            app.Cell_7_9.Text = '';

            % Create Cell_7_10
            app.Cell_7_10 = uibutton(app.Field, 'push');
            app.Cell_7_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_10ButtonPushed, true);
            app.Cell_7_10.Position = [180 160 20 20];
            app.Cell_7_10.Text = '';

            % Create Cell_7_11
            app.Cell_7_11 = uibutton(app.Field, 'push');
            app.Cell_7_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_11ButtonPushed, true);
            app.Cell_7_11.Position = [200 160 20 20];
            app.Cell_7_11.Text = '';

            % Create Cell_7_12
            app.Cell_7_12 = uibutton(app.Field, 'push');
            app.Cell_7_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_12ButtonPushed, true);
            app.Cell_7_12.Position = [220 160 20 20];
            app.Cell_7_12.Text = '';

            % Create Cell_7_13
            app.Cell_7_13 = uibutton(app.Field, 'push');
            app.Cell_7_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_13ButtonPushed, true);
            app.Cell_7_13.Position = [240 160 20 20];
            app.Cell_7_13.Text = '';

            % Create Cell_7_14
            app.Cell_7_14 = uibutton(app.Field, 'push');
            app.Cell_7_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_14ButtonPushed, true);
            app.Cell_7_14.Position = [260 160 20 20];
            app.Cell_7_14.Text = '';

            % Create Cell_7_15
            app.Cell_7_15 = uibutton(app.Field, 'push');
            app.Cell_7_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_7_15ButtonPushed, true);
            app.Cell_7_15.Position = [280 160 20 20];
            app.Cell_7_15.Text = '';

            % Create Cell_8_1
            app.Cell_8_1 = uibutton(app.Field, 'push');
            app.Cell_8_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_1ButtonPushed, true);
            app.Cell_8_1.Position = [0 140 20 20];
            app.Cell_8_1.Text = '';

            % Create Cell_8_2
            app.Cell_8_2 = uibutton(app.Field, 'push');
            app.Cell_8_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_2ButtonPushed, true);
            app.Cell_8_2.Position = [20 140 20 20];
            app.Cell_8_2.Text = '';

            % Create Cell_8_3
            app.Cell_8_3 = uibutton(app.Field, 'push');
            app.Cell_8_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_3ButtonPushed, true);
            app.Cell_8_3.Position = [40 140 20 20];
            app.Cell_8_3.Text = '';

            % Create Cell_8_4
            app.Cell_8_4 = uibutton(app.Field, 'push');
            app.Cell_8_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_4ButtonPushed, true);
            app.Cell_8_4.Position = [60 140 20 20];
            app.Cell_8_4.Text = '';

            % Create Cell_8_5
            app.Cell_8_5 = uibutton(app.Field, 'push');
            app.Cell_8_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_5ButtonPushed, true);
            app.Cell_8_5.Position = [80 140 20 20];
            app.Cell_8_5.Text = '';

            % Create Cell_8_6
            app.Cell_8_6 = uibutton(app.Field, 'push');
            app.Cell_8_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_6ButtonPushed, true);
            app.Cell_8_6.Position = [100 140 20 20];
            app.Cell_8_6.Text = '';

            % Create Cell_8_7
            app.Cell_8_7 = uibutton(app.Field, 'push');
            app.Cell_8_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_7ButtonPushed, true);
            app.Cell_8_7.Position = [120 140 20 20];
            app.Cell_8_7.Text = '';

            % Create Cell_8_8
            app.Cell_8_8 = uibutton(app.Field, 'push');
            app.Cell_8_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_8ButtonPushed, true);
            app.Cell_8_8.Position = [140 140 20 20];
            app.Cell_8_8.Text = '';

            % Create Cell_8_9
            app.Cell_8_9 = uibutton(app.Field, 'push');
            app.Cell_8_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_9ButtonPushed, true);
            app.Cell_8_9.Position = [160 140 20 20];
            app.Cell_8_9.Text = '';

            % Create Cell_8_10
            app.Cell_8_10 = uibutton(app.Field, 'push');
            app.Cell_8_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_10ButtonPushed, true);
            app.Cell_8_10.Position = [180 140 20 20];
            app.Cell_8_10.Text = '';

            % Create Cell_8_11
            app.Cell_8_11 = uibutton(app.Field, 'push');
            app.Cell_8_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_11ButtonPushed, true);
            app.Cell_8_11.Position = [200 140 20 20];
            app.Cell_8_11.Text = '';

            % Create Cell_8_12
            app.Cell_8_12 = uibutton(app.Field, 'push');
            app.Cell_8_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_12ButtonPushed, true);
            app.Cell_8_12.Position = [220 140 20 20];
            app.Cell_8_12.Text = '';

            % Create Cell_8_13
            app.Cell_8_13 = uibutton(app.Field, 'push');
            app.Cell_8_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_13ButtonPushed, true);
            app.Cell_8_13.Position = [240 140 20 20];
            app.Cell_8_13.Text = '';

            % Create Cell_8_14
            app.Cell_8_14 = uibutton(app.Field, 'push');
            app.Cell_8_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_14ButtonPushed, true);
            app.Cell_8_14.Position = [260 140 20 20];
            app.Cell_8_14.Text = '';

            % Create Cell_8_15
            app.Cell_8_15 = uibutton(app.Field, 'push');
            app.Cell_8_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_8_15ButtonPushed, true);
            app.Cell_8_15.Position = [280 140 20 20];
            app.Cell_8_15.Text = '';

            % Create Cell_9_1
            app.Cell_9_1 = uibutton(app.Field, 'push');
            app.Cell_9_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_1ButtonPushed, true);
            app.Cell_9_1.Position = [0 120 20 20];
            app.Cell_9_1.Text = '';

            % Create Cell_9_2
            app.Cell_9_2 = uibutton(app.Field, 'push');
            app.Cell_9_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_2ButtonPushed, true);
            app.Cell_9_2.Position = [20 120 20 20];
            app.Cell_9_2.Text = '';

            % Create Cell_9_3
            app.Cell_9_3 = uibutton(app.Field, 'push');
            app.Cell_9_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_3ButtonPushed, true);
            app.Cell_9_3.Position = [40 120 20 20];
            app.Cell_9_3.Text = '';

            % Create Cell_9_4
            app.Cell_9_4 = uibutton(app.Field, 'push');
            app.Cell_9_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_4ButtonPushed, true);
            app.Cell_9_4.Position = [60 120 20 20];
            app.Cell_9_4.Text = '';

            % Create Cell_9_5
            app.Cell_9_5 = uibutton(app.Field, 'push');
            app.Cell_9_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_5ButtonPushed, true);
            app.Cell_9_5.Position = [80 120 20 20];
            app.Cell_9_5.Text = '';

            % Create Cell_9_6
            app.Cell_9_6 = uibutton(app.Field, 'push');
            app.Cell_9_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_6ButtonPushed, true);
            app.Cell_9_6.Position = [100 120 20 20];
            app.Cell_9_6.Text = '';

            % Create Cell_9_7
            app.Cell_9_7 = uibutton(app.Field, 'push');
            app.Cell_9_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_7ButtonPushed, true);
            app.Cell_9_7.Position = [120 120 20 20];
            app.Cell_9_7.Text = '';

            % Create Cell_9_8
            app.Cell_9_8 = uibutton(app.Field, 'push');
            app.Cell_9_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_8ButtonPushed, true);
            app.Cell_9_8.Position = [140 120 20 20];
            app.Cell_9_8.Text = '';

            % Create Cell_9_9
            app.Cell_9_9 = uibutton(app.Field, 'push');
            app.Cell_9_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_9ButtonPushed, true);
            app.Cell_9_9.Position = [160 120 20 20];
            app.Cell_9_9.Text = '';

            % Create Cell_9_10
            app.Cell_9_10 = uibutton(app.Field, 'push');
            app.Cell_9_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_10ButtonPushed, true);
            app.Cell_9_10.Position = [180 120 20 20];
            app.Cell_9_10.Text = '';

            % Create Cell_9_11
            app.Cell_9_11 = uibutton(app.Field, 'push');
            app.Cell_9_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_11ButtonPushed, true);
            app.Cell_9_11.Position = [200 120 20 20];
            app.Cell_9_11.Text = '';

            % Create Cell_9_12
            app.Cell_9_12 = uibutton(app.Field, 'push');
            app.Cell_9_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_12ButtonPushed, true);
            app.Cell_9_12.Position = [220 120 20 20];
            app.Cell_9_12.Text = '';

            % Create Cell_9_13
            app.Cell_9_13 = uibutton(app.Field, 'push');
            app.Cell_9_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_13ButtonPushed, true);
            app.Cell_9_13.Position = [240 120 20 20];
            app.Cell_9_13.Text = '';

            % Create Cell_9_14
            app.Cell_9_14 = uibutton(app.Field, 'push');
            app.Cell_9_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_14ButtonPushed, true);
            app.Cell_9_14.Position = [260 120 20 20];
            app.Cell_9_14.Text = '';

            % Create Cell_9_15
            app.Cell_9_15 = uibutton(app.Field, 'push');
            app.Cell_9_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_9_15ButtonPushed, true);
            app.Cell_9_15.Position = [280 120 20 20];
            app.Cell_9_15.Text = '';

            % Create Cell_10_1
            app.Cell_10_1 = uibutton(app.Field, 'push');
            app.Cell_10_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_1ButtonPushed, true);
            app.Cell_10_1.Position = [0 100 20 20];
            app.Cell_10_1.Text = '';

            % Create Cell_10_2
            app.Cell_10_2 = uibutton(app.Field, 'push');
            app.Cell_10_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_2ButtonPushed, true);
            app.Cell_10_2.Position = [20 100 20 20];
            app.Cell_10_2.Text = '';

            % Create Cell_10_3
            app.Cell_10_3 = uibutton(app.Field, 'push');
            app.Cell_10_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_3ButtonPushed, true);
            app.Cell_10_3.Position = [40 100 20 20];
            app.Cell_10_3.Text = '';

            % Create Cell_10_4
            app.Cell_10_4 = uibutton(app.Field, 'push');
            app.Cell_10_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_4ButtonPushed, true);
            app.Cell_10_4.Position = [60 100 20 20];
            app.Cell_10_4.Text = '';

            % Create Cell_10_5
            app.Cell_10_5 = uibutton(app.Field, 'push');
            app.Cell_10_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_5ButtonPushed, true);
            app.Cell_10_5.Position = [80 100 20 20];
            app.Cell_10_5.Text = '';

            % Create Cell_10_6
            app.Cell_10_6 = uibutton(app.Field, 'push');
            app.Cell_10_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_6ButtonPushed, true);
            app.Cell_10_6.Position = [100 100 20 20];
            app.Cell_10_6.Text = '';

            % Create Cell_10_7
            app.Cell_10_7 = uibutton(app.Field, 'push');
            app.Cell_10_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_7ButtonPushed, true);
            app.Cell_10_7.Position = [120 100 20 20];
            app.Cell_10_7.Text = '';

            % Create Cell_10_8
            app.Cell_10_8 = uibutton(app.Field, 'push');
            app.Cell_10_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_8ButtonPushed, true);
            app.Cell_10_8.Position = [140 100 20 20];
            app.Cell_10_8.Text = '';

            % Create Cell_10_9
            app.Cell_10_9 = uibutton(app.Field, 'push');
            app.Cell_10_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_9ButtonPushed, true);
            app.Cell_10_9.Position = [160 100 20 20];
            app.Cell_10_9.Text = '';

            % Create Cell_10_10
            app.Cell_10_10 = uibutton(app.Field, 'push');
            app.Cell_10_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_10ButtonPushed, true);
            app.Cell_10_10.Position = [180 100 20 20];
            app.Cell_10_10.Text = '';

            % Create Cell_10_11
            app.Cell_10_11 = uibutton(app.Field, 'push');
            app.Cell_10_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_11ButtonPushed, true);
            app.Cell_10_11.Position = [200 100 20 20];
            app.Cell_10_11.Text = '';

            % Create Cell_10_12
            app.Cell_10_12 = uibutton(app.Field, 'push');
            app.Cell_10_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_12ButtonPushed, true);
            app.Cell_10_12.Position = [220 100 20 20];
            app.Cell_10_12.Text = '';

            % Create Cell_10_13
            app.Cell_10_13 = uibutton(app.Field, 'push');
            app.Cell_10_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_13ButtonPushed, true);
            app.Cell_10_13.Position = [240 100 20 20];
            app.Cell_10_13.Text = '';

            % Create Cell_10_14
            app.Cell_10_14 = uibutton(app.Field, 'push');
            app.Cell_10_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_14ButtonPushed, true);
            app.Cell_10_14.Position = [260 100 20 20];
            app.Cell_10_14.Text = '';

            % Create Cell_10_15
            app.Cell_10_15 = uibutton(app.Field, 'push');
            app.Cell_10_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_10_15ButtonPushed, true);
            app.Cell_10_15.Position = [280 100 20 20];
            app.Cell_10_15.Text = '';

            % Create Cell_11_1
            app.Cell_11_1 = uibutton(app.Field, 'push');
            app.Cell_11_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_1ButtonPushed, true);
            app.Cell_11_1.Position = [0 80 20 20];
            app.Cell_11_1.Text = '';

            % Create Cell_11_2
            app.Cell_11_2 = uibutton(app.Field, 'push');
            app.Cell_11_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_2ButtonPushed, true);
            app.Cell_11_2.Position = [20 80 20 20];
            app.Cell_11_2.Text = '';

            % Create Cell_11_3
            app.Cell_11_3 = uibutton(app.Field, 'push');
            app.Cell_11_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_3ButtonPushed, true);
            app.Cell_11_3.Position = [40 80 20 20];
            app.Cell_11_3.Text = '';

            % Create Cell_11_4
            app.Cell_11_4 = uibutton(app.Field, 'push');
            app.Cell_11_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_4ButtonPushed, true);
            app.Cell_11_4.Position = [60 80 20 20];
            app.Cell_11_4.Text = '';

            % Create Cell_11_5
            app.Cell_11_5 = uibutton(app.Field, 'push');
            app.Cell_11_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_5ButtonPushed, true);
            app.Cell_11_5.Position = [80 80 20 20];
            app.Cell_11_5.Text = '';

            % Create Cell_11_6
            app.Cell_11_6 = uibutton(app.Field, 'push');
            app.Cell_11_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_6ButtonPushed, true);
            app.Cell_11_6.Position = [100 80 20 20];
            app.Cell_11_6.Text = '';

            % Create Cell_11_7
            app.Cell_11_7 = uibutton(app.Field, 'push');
            app.Cell_11_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_7ButtonPushed, true);
            app.Cell_11_7.Position = [120 80 20 20];
            app.Cell_11_7.Text = '';

            % Create Cell_11_8
            app.Cell_11_8 = uibutton(app.Field, 'push');
            app.Cell_11_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_8ButtonPushed, true);
            app.Cell_11_8.Position = [140 80 20 20];
            app.Cell_11_8.Text = '';

            % Create Cell_11_9
            app.Cell_11_9 = uibutton(app.Field, 'push');
            app.Cell_11_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_9ButtonPushed, true);
            app.Cell_11_9.Position = [160 80 20 20];
            app.Cell_11_9.Text = '';

            % Create Cell_11_10
            app.Cell_11_10 = uibutton(app.Field, 'push');
            app.Cell_11_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_10ButtonPushed, true);
            app.Cell_11_10.Position = [180 80 20 20];
            app.Cell_11_10.Text = '';

            % Create Cell_11_11
            app.Cell_11_11 = uibutton(app.Field, 'push');
            app.Cell_11_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_11ButtonPushed, true);
            app.Cell_11_11.Position = [200 80 20 20];
            app.Cell_11_11.Text = '';

            % Create Cell_11_12
            app.Cell_11_12 = uibutton(app.Field, 'push');
            app.Cell_11_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_12ButtonPushed, true);
            app.Cell_11_12.Position = [220 80 20 20];
            app.Cell_11_12.Text = '';

            % Create Cell_11_13
            app.Cell_11_13 = uibutton(app.Field, 'push');
            app.Cell_11_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_13ButtonPushed, true);
            app.Cell_11_13.Position = [240 80 20 20];
            app.Cell_11_13.Text = '';

            % Create Cell_11_14
            app.Cell_11_14 = uibutton(app.Field, 'push');
            app.Cell_11_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_14ButtonPushed, true);
            app.Cell_11_14.Position = [260 80 20 20];
            app.Cell_11_14.Text = '';

            % Create Cell_11_15
            app.Cell_11_15 = uibutton(app.Field, 'push');
            app.Cell_11_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_11_15ButtonPushed, true);
            app.Cell_11_15.Position = [280 80 20 20];
            app.Cell_11_15.Text = '';

            % Create Cell_12_1
            app.Cell_12_1 = uibutton(app.Field, 'push');
            app.Cell_12_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_1ButtonPushed, true);
            app.Cell_12_1.Position = [0 60 20 20];
            app.Cell_12_1.Text = '';

            % Create Cell_12_2
            app.Cell_12_2 = uibutton(app.Field, 'push');
            app.Cell_12_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_2ButtonPushed, true);
            app.Cell_12_2.Position = [20 60 20 20];
            app.Cell_12_2.Text = '';

            % Create Cell_12_3
            app.Cell_12_3 = uibutton(app.Field, 'push');
            app.Cell_12_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_3ButtonPushed, true);
            app.Cell_12_3.Position = [40 60 20 20];
            app.Cell_12_3.Text = '';

            % Create Cell_12_4
            app.Cell_12_4 = uibutton(app.Field, 'push');
            app.Cell_12_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_4ButtonPushed, true);
            app.Cell_12_4.Position = [60 60 20 20];
            app.Cell_12_4.Text = '';

            % Create Cell_12_5
            app.Cell_12_5 = uibutton(app.Field, 'push');
            app.Cell_12_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_5ButtonPushed, true);
            app.Cell_12_5.Position = [80 60 20 20];
            app.Cell_12_5.Text = '';

            % Create Cell_12_6
            app.Cell_12_6 = uibutton(app.Field, 'push');
            app.Cell_12_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_6ButtonPushed, true);
            app.Cell_12_6.Position = [100 60 20 20];
            app.Cell_12_6.Text = '';

            % Create Cell_12_7
            app.Cell_12_7 = uibutton(app.Field, 'push');
            app.Cell_12_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_7ButtonPushed, true);
            app.Cell_12_7.Position = [120 60 20 20];
            app.Cell_12_7.Text = '';

            % Create Cell_12_8
            app.Cell_12_8 = uibutton(app.Field, 'push');
            app.Cell_12_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_8ButtonPushed, true);
            app.Cell_12_8.Position = [140 60 20 20];
            app.Cell_12_8.Text = '';

            % Create Cell_12_9
            app.Cell_12_9 = uibutton(app.Field, 'push');
            app.Cell_12_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_9ButtonPushed, true);
            app.Cell_12_9.Position = [160 60 20 20];
            app.Cell_12_9.Text = '';

            % Create Cell_12_10
            app.Cell_12_10 = uibutton(app.Field, 'push');
            app.Cell_12_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_10ButtonPushed, true);
            app.Cell_12_10.Position = [180 60 20 20];
            app.Cell_12_10.Text = '';

            % Create Cell_12_11
            app.Cell_12_11 = uibutton(app.Field, 'push');
            app.Cell_12_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_11ButtonPushed, true);
            app.Cell_12_11.Position = [200 60 20 20];
            app.Cell_12_11.Text = '';

            % Create Cell_12_12
            app.Cell_12_12 = uibutton(app.Field, 'push');
            app.Cell_12_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_12ButtonPushed, true);
            app.Cell_12_12.Position = [220 60 20 20];
            app.Cell_12_12.Text = '';

            % Create Cell_12_13
            app.Cell_12_13 = uibutton(app.Field, 'push');
            app.Cell_12_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_13ButtonPushed, true);
            app.Cell_12_13.Position = [240 60 20 20];
            app.Cell_12_13.Text = '';

            % Create Cell_12_14
            app.Cell_12_14 = uibutton(app.Field, 'push');
            app.Cell_12_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_14ButtonPushed, true);
            app.Cell_12_14.Position = [260 60 20 20];
            app.Cell_12_14.Text = '';

            % Create Cell_12_15
            app.Cell_12_15 = uibutton(app.Field, 'push');
            app.Cell_12_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_12_15ButtonPushed, true);
            app.Cell_12_15.Position = [280 60 20 20];
            app.Cell_12_15.Text = '';

            % Create Cell_13_1
            app.Cell_13_1 = uibutton(app.Field, 'push');
            app.Cell_13_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_1ButtonPushed, true);
            app.Cell_13_1.Position = [0 40 20 20];
            app.Cell_13_1.Text = '';

            % Create Cell_13_2
            app.Cell_13_2 = uibutton(app.Field, 'push');
            app.Cell_13_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_2ButtonPushed, true);
            app.Cell_13_2.Position = [20 40 20 20];
            app.Cell_13_2.Text = '';

            % Create Cell_13_3
            app.Cell_13_3 = uibutton(app.Field, 'push');
            app.Cell_13_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_3ButtonPushed, true);
            app.Cell_13_3.Position = [40 40 20 20];
            app.Cell_13_3.Text = '';

            % Create Cell_13_4
            app.Cell_13_4 = uibutton(app.Field, 'push');
            app.Cell_13_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_4ButtonPushed, true);
            app.Cell_13_4.Position = [60 40 20 20];
            app.Cell_13_4.Text = '';

            % Create Cell_13_5
            app.Cell_13_5 = uibutton(app.Field, 'push');
            app.Cell_13_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_5ButtonPushed, true);
            app.Cell_13_5.Position = [80 40 20 20];
            app.Cell_13_5.Text = '';

            % Create Cell_13_6
            app.Cell_13_6 = uibutton(app.Field, 'push');
            app.Cell_13_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_6ButtonPushed, true);
            app.Cell_13_6.Position = [100 40 20 20];
            app.Cell_13_6.Text = '';

            % Create Cell_13_7
            app.Cell_13_7 = uibutton(app.Field, 'push');
            app.Cell_13_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_7ButtonPushed, true);
            app.Cell_13_7.Position = [120 40 20 20];
            app.Cell_13_7.Text = '';

            % Create Cell_13_8
            app.Cell_13_8 = uibutton(app.Field, 'push');
            app.Cell_13_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_8ButtonPushed, true);
            app.Cell_13_8.Position = [140 40 20 20];
            app.Cell_13_8.Text = '';

            % Create Cell_13_9
            app.Cell_13_9 = uibutton(app.Field, 'push');
            app.Cell_13_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_9ButtonPushed, true);
            app.Cell_13_9.Position = [160 40 20 20];
            app.Cell_13_9.Text = '';

            % Create Cell_13_10
            app.Cell_13_10 = uibutton(app.Field, 'push');
            app.Cell_13_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_10ButtonPushed, true);
            app.Cell_13_10.Position = [180 40 20 20];
            app.Cell_13_10.Text = '';

            % Create Cell_13_11
            app.Cell_13_11 = uibutton(app.Field, 'push');
            app.Cell_13_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_11ButtonPushed, true);
            app.Cell_13_11.Position = [200 40 20 20];
            app.Cell_13_11.Text = '';

            % Create Cell_13_12
            app.Cell_13_12 = uibutton(app.Field, 'push');
            app.Cell_13_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_12ButtonPushed, true);
            app.Cell_13_12.Position = [220 40 20 20];
            app.Cell_13_12.Text = '';

            % Create Cell_13_13
            app.Cell_13_13 = uibutton(app.Field, 'push');
            app.Cell_13_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_13ButtonPushed, true);
            app.Cell_13_13.Position = [240 40 20 20];
            app.Cell_13_13.Text = '';

            % Create Cell_13_14
            app.Cell_13_14 = uibutton(app.Field, 'push');
            app.Cell_13_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_14ButtonPushed, true);
            app.Cell_13_14.Position = [260 40 20 20];
            app.Cell_13_14.Text = '';

            % Create Cell_13_15
            app.Cell_13_15 = uibutton(app.Field, 'push');
            app.Cell_13_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_13_15ButtonPushed, true);
            app.Cell_13_15.Position = [280 40 20 20];
            app.Cell_13_15.Text = '';

            % Create Cell_14_1
            app.Cell_14_1 = uibutton(app.Field, 'push');
            app.Cell_14_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_1ButtonPushed, true);
            app.Cell_14_1.Position = [0 20 20 20];
            app.Cell_14_1.Text = '';

            % Create Cell_14_2
            app.Cell_14_2 = uibutton(app.Field, 'push');
            app.Cell_14_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_2ButtonPushed, true);
            app.Cell_14_2.Position = [20 20 20 20];
            app.Cell_14_2.Text = '';

            % Create Cell_14_3
            app.Cell_14_3 = uibutton(app.Field, 'push');
            app.Cell_14_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_3ButtonPushed, true);
            app.Cell_14_3.Position = [40 20 20 20];
            app.Cell_14_3.Text = '';

            % Create Cell_14_4
            app.Cell_14_4 = uibutton(app.Field, 'push');
            app.Cell_14_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_4ButtonPushed, true);
            app.Cell_14_4.Position = [60 20 20 20];
            app.Cell_14_4.Text = '';

            % Create Cell_14_5
            app.Cell_14_5 = uibutton(app.Field, 'push');
            app.Cell_14_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_5ButtonPushed, true);
            app.Cell_14_5.Position = [80 20 20 20];
            app.Cell_14_5.Text = '';

            % Create Cell_14_6
            app.Cell_14_6 = uibutton(app.Field, 'push');
            app.Cell_14_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_6ButtonPushed, true);
            app.Cell_14_6.Position = [100 20 20 20];
            app.Cell_14_6.Text = '';

            % Create Cell_14_7
            app.Cell_14_7 = uibutton(app.Field, 'push');
            app.Cell_14_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_7ButtonPushed, true);
            app.Cell_14_7.Position = [120 20 20 20];
            app.Cell_14_7.Text = '';

            % Create Cell_14_8
            app.Cell_14_8 = uibutton(app.Field, 'push');
            app.Cell_14_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_8ButtonPushed, true);
            app.Cell_14_8.Position = [140 20 20 20];
            app.Cell_14_8.Text = '';

            % Create Cell_14_9
            app.Cell_14_9 = uibutton(app.Field, 'push');
            app.Cell_14_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_9ButtonPushed, true);
            app.Cell_14_9.Position = [160 20 20 20];
            app.Cell_14_9.Text = '';

            % Create Cell_14_10
            app.Cell_14_10 = uibutton(app.Field, 'push');
            app.Cell_14_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_10ButtonPushed, true);
            app.Cell_14_10.Position = [180 20 20 20];
            app.Cell_14_10.Text = '';

            % Create Cell_14_11
            app.Cell_14_11 = uibutton(app.Field, 'push');
            app.Cell_14_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_11ButtonPushed, true);
            app.Cell_14_11.Position = [200 20 20 20];
            app.Cell_14_11.Text = '';

            % Create Cell_14_12
            app.Cell_14_12 = uibutton(app.Field, 'push');
            app.Cell_14_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_12ButtonPushed, true);
            app.Cell_14_12.Position = [220 20 20 20];
            app.Cell_14_12.Text = '';

            % Create Cell_14_13
            app.Cell_14_13 = uibutton(app.Field, 'push');
            app.Cell_14_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_13ButtonPushed, true);
            app.Cell_14_13.Position = [240 20 20 20];
            app.Cell_14_13.Text = '';

            % Create Cell_14_14
            app.Cell_14_14 = uibutton(app.Field, 'push');
            app.Cell_14_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_14ButtonPushed, true);
            app.Cell_14_14.Position = [260 20 20 20];
            app.Cell_14_14.Text = '';

            % Create Cell_14_15
            app.Cell_14_15 = uibutton(app.Field, 'push');
            app.Cell_14_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_14_15ButtonPushed, true);
            app.Cell_14_15.Position = [280 20 20 20];
            app.Cell_14_15.Text = '';

            % Create Cell_15_1
            app.Cell_15_1 = uibutton(app.Field, 'push');
            app.Cell_15_1.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_1ButtonPushed, true);
            app.Cell_15_1.Position = [0 0 20 20];
            app.Cell_15_1.Text = '';

            % Create Cell_15_2
            app.Cell_15_2 = uibutton(app.Field, 'push');
            app.Cell_15_2.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_2ButtonPushed, true);
            app.Cell_15_2.Position = [20 0 20 20];
            app.Cell_15_2.Text = '';

            % Create Cell_15_3
            app.Cell_15_3 = uibutton(app.Field, 'push');
            app.Cell_15_3.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_3ButtonPushed, true);
            app.Cell_15_3.Position = [40 0 20 20];
            app.Cell_15_3.Text = '';

            % Create Cell_15_4
            app.Cell_15_4 = uibutton(app.Field, 'push');
            app.Cell_15_4.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_4ButtonPushed, true);
            app.Cell_15_4.Position = [60 0 20 20];
            app.Cell_15_4.Text = '';

            % Create Cell_15_5
            app.Cell_15_5 = uibutton(app.Field, 'push');
            app.Cell_15_5.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_5ButtonPushed, true);
            app.Cell_15_5.Position = [80 0 20 20];
            app.Cell_15_5.Text = '';

            % Create Cell_15_6
            app.Cell_15_6 = uibutton(app.Field, 'push');
            app.Cell_15_6.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_6ButtonPushed, true);
            app.Cell_15_6.Position = [100 0 20 20];
            app.Cell_15_6.Text = '';

            % Create Cell_15_7
            app.Cell_15_7 = uibutton(app.Field, 'push');
            app.Cell_15_7.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_7ButtonPushed, true);
            app.Cell_15_7.Position = [120 0 20 20];
            app.Cell_15_7.Text = '';

            % Create Cell_15_8
            app.Cell_15_8 = uibutton(app.Field, 'push');
            app.Cell_15_8.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_8ButtonPushed, true);
            app.Cell_15_8.Position = [140 0 20 20];
            app.Cell_15_8.Text = '';

            % Create Cell_15_9
            app.Cell_15_9 = uibutton(app.Field, 'push');
            app.Cell_15_9.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_9ButtonPushed, true);
            app.Cell_15_9.Position = [160 0 20 20];
            app.Cell_15_9.Text = '';

            % Create Cell_15_10
            app.Cell_15_10 = uibutton(app.Field, 'push');
            app.Cell_15_10.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_10ButtonPushed, true);
            app.Cell_15_10.Position = [180 0 20 20];
            app.Cell_15_10.Text = '';

            % Create Cell_15_11
            app.Cell_15_11 = uibutton(app.Field, 'push');
            app.Cell_15_11.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_11ButtonPushed, true);
            app.Cell_15_11.Position = [200 0 20 20];
            app.Cell_15_11.Text = '';

            % Create Cell_15_12
            app.Cell_15_12 = uibutton(app.Field, 'push');
            app.Cell_15_12.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_12ButtonPushed, true);
            app.Cell_15_12.Position = [220 0 20 20];
            app.Cell_15_12.Text = '';

            % Create Cell_15_13
            app.Cell_15_13 = uibutton(app.Field, 'push');
            app.Cell_15_13.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_13ButtonPushed, true);
            app.Cell_15_13.Position = [240 0 20 20];
            app.Cell_15_13.Text = '';

            % Create Cell_15_14
            app.Cell_15_14 = uibutton(app.Field, 'push');
            app.Cell_15_14.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_14ButtonPushed, true);
            app.Cell_15_14.Position = [260 0 20 20];
            app.Cell_15_14.Text = '';

            % Create Cell_15_15
            app.Cell_15_15 = uibutton(app.Field, 'push');
            app.Cell_15_15.ButtonPushedFcn = ...
                createCallbackFcn(app, @Cell_15_15ButtonPushed, true);
            app.Cell_15_15.Position = [280 0 20 20];
            app.Cell_15_15.Text = '';

            % Create MinesweeperLabel
            app.MinesweeperLabel = uilabel(app.UIFigure);
            app.MinesweeperLabel.BackgroundColor = [1 1 1];
            app.MinesweeperLabel.HorizontalAlignment = 'center';
            app.MinesweeperLabel.FontSize = 15;
            app.MinesweeperLabel.FontWeight = 'bold';
            app.MinesweeperLabel.FontAngle = 'italic';
            app.MinesweeperLabel.Position = [111 368 99 22];
            app.MinesweeperLabel.Text = 'Minesweeper';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = okienkowo

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end