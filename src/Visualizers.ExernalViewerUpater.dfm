object fmIntegerUpdater: TfmIntegerUpdater
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'fmIntegerUpdater'
  ClientHeight = 265
  ClientWidth = 649
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
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 649
    Height = 265
    ActivePage = tsVisualizer
    Align = alClient
    TabOrder = 0
    object tsVisualizer: TTabSheet
      Caption = 'Visualizer'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnBottom: TPanel
        Left = 0
        Top = 70
        Width = 641
        Height = 167
        Align = alBottom
        TabOrder = 0
        object gbValues: TGroupBox
          Left = 1
          Top = 1
          Width = 639
          Height = 165
          Align = alClient
          Caption = 'Values'
          TabOrder = 0
          object sgValues: TStringGrid
            Left = 2
            Top = 15
            Width = 635
            Height = 148
            Align = alClient
            ColCount = 2
            RowCount = 4
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
            ScrollBars = ssNone
            TabOrder = 0
            OnSelectCell = sgValuesSelectCell
            ColWidths = (
              64
              526)
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 70
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object gbValue: TGroupBox
          Left = 0
          Top = 0
          Width = 641
          Height = 70
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
    end
    object tsIDEInfo: TTabSheet
      Caption = 'IDE Info'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object memIDEInfo: TMemo
        Left = 0
        Top = 0
        Width = 641
        Height = 237
        Align = alClient
        Lines.Strings = (
          'memIDEInfo')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
end
