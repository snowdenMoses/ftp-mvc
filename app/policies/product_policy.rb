class ProductPolicy < ApplicationPolicy
  include PunditHelper
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
    @authorized_roles = ["admin", "vendor"]
  end


  def index?
    is_authorized_role?(@authorized_roles, @user)
  end

  def create?
    is_authorized_role?(@authorized_roles, @user)
  end

  def new?
    is_authorized_role?(@authorized_roles, @user)
  end

  def update?
    is_authorized_role?(@authorized_roles, @user)
  end

  def edit?
    is_authorized_role?(@authorized_roles, @user)
  end

end
