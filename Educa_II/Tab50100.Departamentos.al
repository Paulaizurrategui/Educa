table 50100 "Departamentos"
{
    DataClassification = CustomerContent;
    Caption = 'Departamentos';

    fields
    {
        field(1; "Código"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código';
        }
        field(2; "Edificio"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Edificio';
        }
        field(3; "Delegado"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Delegado';
        }
    }

    keys
    {
        key(PK; "Código")
        {
            Clustered = true;
        }
    }
}
