{{- $short := (shortname .Type.Name) -}}
// {{ .Name }} returns the {{ .RefType.Name }} associated with the {{ .Type.Name }}'s {{ .Field.Name }} ({{ .Field.Col.ColumnName }}).
//
// Generated from foreign key '{{ .ForeignKey.ForeignKeyName }}'.
func ({{ $short }} *{{ .Type.Name }}) {{ .Name }}(db XODB) (*{{ .RefType.Name }}, error) {
	{{- if nullablefield .Field }}
	if !{{ $short }}.{{ .Field.Name }}.Valid {
		return nil, nil
	}
	{{- end }}
	return {{ .RefType.Name }}By{{ .RefField.Name }}(db, {{ convext $short .Field .RefField }})
}
