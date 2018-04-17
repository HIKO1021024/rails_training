module ApplicationHelper
    def user_admin?
        if current_user.admin == "f"
            redirect_to articles_path
        end
    end
end
