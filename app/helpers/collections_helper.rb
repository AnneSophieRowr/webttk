module CollectionsHelper

  def statuses
    [[t('helpers.words.all'), 0]] + Status.all.collect {|s| [s.name, s.id]}
  end

  def categories
    [[t('helpers.words.all'), 0]] + Category.all.collect {|s| [s.name, s.id]}
  end

  def infrastructures
    [[t('helpers.words.all'), 0]] + Device::INFRASTRUCTURES.collect {|infra| [infra, infra]}
  end

  def virtuals
    [[t('helpers.words.all'), 0]] + Device::VIRTUAL.collect {|virtual| [virtual, virtual]}
  end

  def os
    [[t('helpers.words.all'), 0]] + Device::OS.collect {|os| [os, os]}
  end

  def users
    [[t('helpers.words.all'), 0]] + User.all.collect {|s| [s.name, s.id]}
  end

end
