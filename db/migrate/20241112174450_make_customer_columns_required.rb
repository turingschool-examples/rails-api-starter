class MakeCustomerColumnsRequired < ActiveRecord::Migration[7.1]
  def change
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name, false
    change_column_null :customers, :email, false
    change_column_null :customers, :street_address, false
    change_column_null :customers, :city, false
    change_column_null :customers, :state, false
    change_column_null :customers, :zip, false
  end
end
