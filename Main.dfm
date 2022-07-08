object Form1: TForm1
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Easter calculation'
  ClientHeight = 326
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnCal: TButton
    Left = 360
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Calculate'
    Default = True
    TabOrder = 0
    OnClick = btnCalClick
  end
  object btnExit: TButton
    Left = 360
    Top = 64
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Exit'
    TabOrder = 1
    OnClick = btnExitClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 313
    Height = 97
    Caption = 'User input data'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 283
      Height = 13
      Caption = 'Please insert the year you want to calculate the Easter date:'
    end
    object edtYear: TEdit
      Left = 16
      Top = 56
      Width = 60
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      Text = '2022'
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 128
    Width = 313
    Height = 169
    Caption = 'Results'
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 225
      Height = 13
      Caption = 'The Easter Sunday for Western Churches is on:'
    end
    object Label3: TLabel
      Left = 16
      Top = 104
      Width = 221
      Height = 13
      Caption = 'The Easter Sunday for Eastern Churches is on:'
    end
    object edtGregorian: TEdit
      Left = 16
      Top = 56
      Width = 75
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 0
    end
    object edtOthodox: TEdit
      Left = 16
      Top = 128
      Width = 75
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 1
    end
  end
end
