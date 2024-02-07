module LayoutRouter

  def layout_passthrough(user)
    vendor = ['vendor']

    if user
      if is_authorized_role?(vendor, user)
        render layout: "vendor"
      else
        render layout: "customer"
      end
    end
  end
end