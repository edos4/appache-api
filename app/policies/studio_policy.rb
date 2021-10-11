class StudioPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    [
      'admin'
    ].include?(user.role)
  end

  def show?
    [
      'admin'
    ].include?(user.role)
  end

  def create?
    [
      'admin'
    ].include?(user.role)
  end

  def new?
    [
      'admin'
    ].include?(user.role)
  end

  def update?
    [
      'admin'
    ].include?(user.role)
  end

  def edit?
    [
      'admin'
    ].include?(user.role)
  end

  def destroy?
    [
      'admin'
    ].include?(user.role)
  end

  def example_method?
    true
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
