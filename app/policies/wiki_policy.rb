class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?
    true
  end
  
  def show?
  	true
  end
 
  def update?
    user.present? && (record.user == user || user.admin? )
  end

end
