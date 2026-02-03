table 50101 "Profesores"
{
    DataClassification = CustomerContent;
    Caption = 'Profesores';

    fields
    {
        field(1; "Código"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código';
        }
        field(2; "Nombre"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Nombre';
        }
        field(3; "Fecha contratación"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Fecha contratación';
        }
        field(4; "Departamento"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Departamento';
            TableRelation = Departamentos."Código";
        }
        // Campos calculados para lookup
        field(10; "Edificio Departamento"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Departamentos.Edificio where("Código" = field(Departamento)));
            Caption = 'Edificio Departamento';
            Editable = false;
        }
        field(11; "Delegado Departamento"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Departamentos.Delegado where("Código" = field(Departamento)));
            Caption = 'Delegado Departamento';
            Editable = false;
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
