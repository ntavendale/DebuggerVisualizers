object fmIntegerUpdater: TfmIntegerUpdater
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'fmIntegerUpdater'
  ClientHeight = 204
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 63
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object gbValue: TGroupBox
      Left = 0
      Top = 0
      Width = 630
      Height = 63
      Align = alClient
      Caption = 'Value'
      TabOrder = 0
      object ebValue: TEdit
        Left = 16
        Top = 24
        Width = 601
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 63
    Width = 630
    Height = 141
    Align = alBottom
    TabOrder = 1
    object gbValues: TGroupBox
      Left = 1
      Top = 1
      Width = 628
      Height = 139
      Align = alClient
      Caption = 'Values'
      TabOrder = 0
      object sgValues: TStringGrid
        Left = 2
        Top = 15
        Width = 624
        Height = 122
        Align = alClient
        ColCount = 2
        RowCount = 4
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ScrollBars = ssNone
        TabOrder = 0
        OnSelectCell = sgValuesSelectCell
        ExplicitLeft = 4
        ExplicitTop = 14
        ColWidths = (
          64
          526)
      end
    end
  end
end
