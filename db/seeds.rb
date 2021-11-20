# frozen_string_literal: true

%i[JavaScript Ruby PHP Python].each do |category|
  PostCategory.create(name: category)
end
