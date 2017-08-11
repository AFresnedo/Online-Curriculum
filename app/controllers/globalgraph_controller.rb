class GlobalgraphController < ApplicationController

  # NOTE old notes
  # something along the lines of the globalgraph controller is the user bookmark
  # mover (think of it as moving the user along designated rails) and the graph
  # controller is the helper so to kind of answer any questions the globalgraph
  # controller has?

  # NOTE current notes
  # the globalgraph controller is in charge of creating "score" tuples, these
  # "ip score tuples" are what the graphs controller uses as "bookmarks" to
  # determine the next theory(s)/problem(s) a user has access to

  # at the moment, purchase curriculums here
  def purchase_curriculum
    # TODO fix scores unique index (test first? lookup in db book?)
    # if already purchased, tell user to reset
    # elsif saved notify user of success and proceed
    # else error (user not logged in? etc)
  end

  def choose_curriculum
    # display purchased curriculums for current_user
    # at the moment, purchase curriculums here
  end

  def resume_curriculum
    # TODO current_user or current_user.id?
    @inProgress = Score.where(user_id: current_user,
                             curriculum: params[curriculum: curriculum],
                             ip: true)
  end

  def index
  end

  # TODO move this to curriculum controller?
  def categories
    all = Globalgraph.all
    @cat_list = []
    all.each do |tuple|
      if (@cat_list.last != tuple.category) ? (@cat_list << tuple.category) : nil
      end
    end
    render '/globalgraph/categories'
  end

  def context
    # all tuples from globalgraph for this category
    all = Globalgraph.where(category: params[:category])
    @cat_intro_ids = []
    @context_list = []
    # process theory files and context directories
    all.each do |item|
      # seperate theoryfile from context directories
      if item.context == 'category_introduction'
        theoryfile = Theory.find_by(category: params[:category], context:
                    'category_introduction')
        @cat_intro_ids << theoryfile.id
      # if new context, add it to list
      elsif item.context != @context_list.last
        @context_list << item.context
      end
    end
    render '/globalgraph/context'
  end
end
