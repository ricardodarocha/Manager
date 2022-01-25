object frmManage: TfrmManage
  Left = 0
  Top = 0
  Caption = 'Demonstra'#231#227'o TManager'
  ClientHeight = 325
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    717
    325)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'New Ferrari'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 40
    Width = 75
    Height = 25
    Caption = 'New Porshe'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'New Chrysler'
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 16
    Top = 103
    Width = 693
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
end
