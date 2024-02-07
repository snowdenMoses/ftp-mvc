module  PunditHelper
    def is_authorized_role?(roles, user)
        (roles & user.roles.map(&:title) ).any?
    end
end