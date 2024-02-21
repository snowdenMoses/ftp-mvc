class AdminAnalyticsController < AdminController
  def index
    top_five_vendors = Product.find_by_sql("Select count(p.user_id) as products_count ,concat(pd.first_name,' ', pd.last_name) as full_name, u.email from products p
        JOIN users u on u.id = p.user_id
        JOIN personal_details pd on pd.user_id = u.id
        Join user_roles ur on ur.user_id = u.id
        Join roles r on r.id = ur.role_id
        WHERE r.title = 'vendor'
        GROUP BY full_name, u.email
        order by products_count desc
        limit 5;")
    @top_five_vendors = formatdata_for_chartjs(top_five_vendors.to_a,
                                               "products", "full_name",
                                               "products_count")

    top_five_favourited_products = Product.find_by_sql("Select count(f.product_id) as products_count, p.name from favourites f
      JOIN products p on p.id = f.product_id
      GROUP BY p.name
      order by products_count desc
      limit 5;")
    @top_five_favourited_products = formatdata_for_chartjs(top_five_favourited_products.to_a,
                                                           "products", "name",
                                                           "products_count")

    top_five_commented_products = Product.find_by_sql("Select count(p.id) as products_count, p.name from products p
      JOIN comments cmt on cmt.commentable_id = p.id
      GROUP BY p.name
      order by products_count desc
      limit 5;;")
    @top_five_commented_products = formatdata_for_chartjs(top_five_commented_products.to_a,
                                                          "products", "name",
                                                          "products_count")


    top_five_products_by_states = Product.find_by_sql("Select count(p.id) as products_count, s.name from products p
    JOIN states s on s.id = p.state_id
    GROUP BY s.name
    order by products_count desc
    limit 5;")

    @top_five_products_by_states = formatdata_for_chartjs(top_five_products_by_states.to_a,
                                                           "products", "name",
                                                           "products_count")

    @number_of_vendors = UserRole.includes(:role).where(role: { title: "vendor" }).size
  end

  private

  def formatdata_for_chartjs(records, title, x_axis, y_axis)
    data = {}
    data["labels"] = []
    data["datasets"] = [{}]
    data["datasets"][0]["data"] = []
    data["datasets"][0]["label"] = title
    data["datasets"][0]["borderWidth"] = 1
    data["datasets"][0]["backgroundColor"] = set_background_color

    records.each do |record|
      data["labels"].push(record[x_axis])
      data["datasets"][0]["data"].push(record[y_axis])
    end
    data
  end

  # def tweak_data_structure
  #   data = {}
  #   data["labels"] = []
  #   data["datasets"] = [{}]
  #   data["datasets"][0]["data"] = []
  #   data
  # end

  def set_background_color
    [
      "rgba(255, 99, 132, 0.2)",
      "rgba(54, 162, 235, 0.2)",
      "rgba(255, 206, 86, 0.2)",
      "rgba(75, 192, 192, 0.2)",
      "rgba(153, 102, 255, 0.2)",
      "rgba(255, 159, 64, 0.2)"
    ]
  end
end
