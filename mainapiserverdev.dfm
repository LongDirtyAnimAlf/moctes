object FmainAPIServerDev: TFmainAPIServerDev
  Left = 330
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Servidor desarrollo API accosoft'
  ClientHeight = 96
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 96
    Align = alClient
    Caption = ' '
    TabOrder = 0
    ExplicitHeight = 68
    object Bevel1: TBevel
      Left = 1
      Top = 1
      Width = 170
      Height = 94
      Align = alLeft
      Shape = bsRightLine
      ExplicitHeight = 95
    end
    object Label1: TLabel
      Left = 19
      Top = 5
      Width = 42
      Height = 13
      Caption = 'SERVER'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 197
      Top = 5
      Width = 38
      Height = 13
      Caption = 'CLIENT'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object startStopBtn: TButton
      Left = 14
      Top = 51
      Width = 90
      Height = 32
      Caption = 'Start ...'
      TabOrder = 0
      OnClick = startStopBtnClick
    end
    object newCustomerBtn: TButton
      Left = 197
      Top = 51
      Width = 147
      Height = 32
      Caption = 'Register customer'
      Enabled = False
      TabOrder = 1
      OnClick = newCustomerBtnClick
    end
  end
  object enableAuthChk: TCheckBox
    Left = 16
    Top = 26
    Width = 137
    Height = 19
    Caption = 'Enable Authentication'
    TabOrder = 1
  end
end
