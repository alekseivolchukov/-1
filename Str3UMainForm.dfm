object MainForm: TMainForm
  Left = 393
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1075#1091#1088#1099
  ClientHeight = 737
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object image: TImage
    Left = 8
    Top = 8
    Width = 505
    Height = 500
  end
  object lbPoint: TLabel
    Left = 8
    Top = 576
    Width = 69
    Height = 13
    Caption = #1055#1077#1088#1074#1072#1103' '#1090#1086#1095#1082#1072
  end
  object lbSecondPoint: TLabel
    Left = 8
    Top = 624
    Width = 67
    Height = 13
    Caption = #1042#1090#1086#1088#1072#1103' '#1090#1086#1095#1082#1072
  end
  object lbColor: TLabel
    Left = 288
    Top = 576
    Width = 25
    Height = 13
    Caption = #1062#1074#1077#1090
  end
  object lbThirdPoint: TLabel
    Left = 288
    Top = 624
    Width = 67
    Height = 13
    Caption = #1058#1088#1077#1090#1100#1103' '#1090#1086#1095#1082#1072
  end
  object rgFig: TRadioGroup
    Left = 8
    Top = 528
    Width = 505
    Height = 41
    Caption = #1050#1072#1082#1091#1102' '#1092#1080#1075#1091#1088#1091' '#1076#1086#1073#1072#1074#1080#1090#1100
    Columns = 3
    Items.Strings = (
      #1050#1088#1091#1075
      #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082
      #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082)
    TabOrder = 0
    OnClick = rgFigClick
  end
  object edPoint: TEdit
    Left = 8
    Top = 592
    Width = 225
    Height = 21
    TabOrder = 1
    Text = '100 100'
    OnKeyPress = edPointKeyPress
  end
  object edSecondPoint: TEdit
    Left = 8
    Top = 640
    Width = 225
    Height = 21
    TabOrder = 2
    Text = '200 200'
    OnKeyPress = edPointKeyPress
  end
  object cbColor: TComboBox
    Left = 288
    Top = 592
    Width = 217
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      #1050#1088#1072#1089#1085#1099#1081
      #1047#1077#1083#1077#1085#1099#1081
      #1057#1080#1085#1080#1081
      #1046#1077#1083#1090#1099#1081
      #1063#1077#1088#1085#1099#1081)
  end
  object edThirdPoint: TEdit
    Left = 288
    Top = 640
    Width = 217
    Height = 21
    TabOrder = 4
    Text = '100 200'
    OnKeyPress = edPointKeyPress
  end
  object btAdd: TButton
    Left = 8
    Top = 688
    Width = 81
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = btAddClick
  end
  object btExit: TButton
    Left = 416
    Top = 688
    Width = 89
    Height = 33
    Cancel = True
    Caption = #1042#1099#1093#1086#1076
    ModalResult = 2
    TabOrder = 6
    OnClick = btExitClick
  end
  object btClear: TButton
    Left = 104
    Top = 688
    Width = 89
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 7
    OnClick = btClearClick
  end
  object btArea: TButton
    Left = 208
    Top = 688
    Width = 89
    Height = 33
    Caption = #1055#1083#1086#1097#1072#1076#1080
    TabOrder = 8
    OnClick = btAreaClick
  end
  object btCircles: TButton
    Left = 312
    Top = 688
    Width = 89
    Height = 33
    Caption = #1050#1088#1091#1075#1080
    TabOrder = 9
    OnClick = btCirclesClick
  end
end
