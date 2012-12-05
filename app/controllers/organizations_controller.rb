class OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if User.find_by_email(@organization.email).nil?
        if @organization.save
          @user = User.create(:email => @organization.email, :password => new_random_password, :full_name => 'admin', :organization_id => @organization.id, :department_id => 1)
          UserMailer.send_user_details(@user).deliver
          format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
          format.json { render json: @organization, status: :created, location: @organization }
        else
          format.html { render action: "new" }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      else
        flash[:error] = 'Your email is exist!'
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :ok }
    end
  end

  def new_random_password
    pass = @organization.email.split('@')[0]

    if pass.length < 7
      random = 7 - pass.length
      pass = pass + Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{@organization.email}--")[0,random]
    else
      pass = @organization.email.split('@')[0]
    end

  end


end
