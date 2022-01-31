class ContacterImport

  include CSVImporter

  model Contact

  # declare the columns to be imported and their aliases
  column :name, as: ['name', 'ame'], required: true
  column :birthday, as: ['birthday', 'birth day', 'day of birth'], required: true
  column :phone, as: ['telephone', 'phone', 'pbx', 'cellphone', 'cell_phone',
    'telephone number', 'telephone_number'
  ], required: true
  column :address, as: ['address', 'location', 'adress', 'addres', 'adres'], required: true
  column :credit_card, as: ['card number', 'credit_card',
    'creditcard', 'number of card', 'number of credit card', 'card'
  ], required: true
  column :email, as: [/e.?mail/i, 'mail', 'electronic mail'], required: true

  when_invalid :skip # or :abort

end
