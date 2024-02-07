class Vendors::AnalyticsController < ApplicationController
  layout 'vendor'
  def index
    sql = "SELECT pd.name, count(f.product_id) as product_count FROM products pd
                                 JOIN favourites f on pd.id = f.product_id
                                 GROUP BY pd.name
                                 ORDER BY product_count DESC
                                 LIMIT 5"

    result = ActiveRecord::Base.connection.execute(sql)
    @top_five_liked_products = result.to_a
  end
end
