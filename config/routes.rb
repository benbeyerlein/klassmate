Rails.application.routes.draw do
  devise_for :users

  root 'students#index'

  # Routes for the Instructor_course_schedule resource:
  # CREATE
  get('/instructor_course_schedules/new', { :controller => 'instructor_course_schedules', :action => 'new' })
  get('/create_instructor_course_schedule', { :controller => 'instructor_course_schedules', :action => 'create' })

  # READ
  get('/instructor_course_schedules', { :controller => 'instructor_course_schedules', :action => 'index' })
  get('/instructor_course_schedules/:id', { :controller => 'instructor_course_schedules', :action => 'show' })

  # UPDATE
  get('/instructor_course_schedules/:id/edit', { :controller => 'instructor_course_schedules', :action => 'edit' })
  get('/update_instructor_course_schedule/:id', { :controller => 'instructor_course_schedules', :action => 'update' })

  # DELETE
  get('/delete_instructor_course_schedule/:id', { :controller => 'instructor_course_schedules', :action => 'destroy' })
  #------------------------------

  # Routes for the Student_course_schedule resource:
  # CREATE
  get('/student_course_schedules/new', { :controller => 'student_course_schedules', :action => 'new' })
  get('/create_student_course_schedule', { :controller => 'student_course_schedules', :action => 'create' })

  # READ
  get('/student_course_schedules', { :controller => 'student_course_schedules', :action => 'index' })
  get('/student_course_schedules/:id', { :controller => 'student_course_schedules', :action => 'show' })

  # UPDATE
  get('/student_course_schedules/:id/edit', { :controller => 'student_course_schedules', :action => 'edit' })
  get('/update_student_course_schedule/:id', { :controller => 'student_course_schedules', :action => 'update' })

  # DELETE
  get('/delete_student_course_schedule/:id', { :controller => 'student_course_schedules', :action => 'destroy' })
  #------------------------------

  # Routes for the Instructor resource:
  # CREATE
  get('/instructors/new', { :controller => 'instructors', :action => 'new' })
  get('/create_instructor', { :controller => 'instructors', :action => 'create' })

  # READ
  get('/instructors', { :controller => 'instructors', :action => 'index' })
  get('/instructors/:id', { :controller => 'instructors', :action => 'show' })

  # UPDATE
  get('/instructors/:id/edit', { :controller => 'instructors', :action => 'edit' })
  get('/update_instructor/:id', { :controller => 'instructors', :action => 'update' })

  # DELETE
  get('/delete_instructor/:id', { :controller => 'instructors', :action => 'destroy' })
  #------------------------------

  # Routes for the Student resource:
  # CREATE
  get('/students/new', { :controller => 'students', :action => 'new' })
  get('/create_student', { :controller => 'students', :action => 'create' })

  # READ
  get('/students', { :controller => 'students', :action => 'index' })
  get('/students/:id', { :controller => 'students', :action => 'show' })

  # UPDATE
  get('/students/:id/edit', { :controller => 'students', :action => 'edit' })
  get('/update_student/:id', { :controller => 'students', :action => 'update' })

  # DELETE
  get('/delete_student/:id', { :controller => 'students', :action => 'destroy' })
  #------------------------------

  # Routes for the Class resource:
  # CREATE
  get('/classes/new', { :controller => 'classes', :action => 'new' })
  get('/create_class', { :controller => 'classes', :action => 'create' })

  # READ
  get('/classes', { :controller => 'classes', :action => 'index' })
  get('/classes/:id', { :controller => 'classes', :action => 'show' })

  # UPDATE
  get('/classes/:id/edit', { :controller => 'classes', :action => 'edit' })
  get('/update_class/:id', { :controller => 'classes', :action => 'update' })

  # DELETE
  get('/delete_class/:id', { :controller => 'classes', :action => 'destroy' })
  #------------------------------

  # Routes for the Course_schedule resource:
  # CREATE
  get('/course_schedules/new', { :controller => 'course_schedules', :action => 'new' })
  get('/create_course_schedule', { :controller => 'course_schedules', :action => 'create' })

  # READ
  get('/course_schedules', { :controller => 'course_schedules', :action => 'index' })
  get('/course_schedules/:id', { :controller => 'course_schedules', :action => 'show' })

  # UPDATE
  get('/course_schedules/:id/edit', { :controller => 'course_schedules', :action => 'edit' })
  get('/update_course_schedule/:id', { :controller => 'course_schedules', :action => 'update' })

  # DELETE
  get('/delete_course_schedule/:id', { :controller => 'course_schedules', :action => 'destroy' })
  #------------------------------

  # Routes for the Quarter resource:
  # CREATE
  get('/quarters/new', { :controller => 'quarters', :action => 'new' })
  get('/create_quarter', { :controller => 'quarters', :action => 'create' })

  # READ
  get('/quarters', { :controller => 'quarters', :action => 'index' })
  get('/quarters/:id', { :controller => 'quarters', :action => 'show' })

  # UPDATE
  get('/quarters/:id/edit', { :controller => 'quarters', :action => 'edit' })
  get('/update_quarter/:id', { :controller => 'quarters', :action => 'update' })

  # DELETE
  get('/delete_quarter/:id', { :controller => 'quarters', :action => 'destroy' })
  #------------------------------

  # Routes for the Course resource:
  # CREATE
  get('/courses/new', { :controller => 'courses', :action => 'new' })
  get('/create_course', { :controller => 'courses', :action => 'create' })

  # READ
  get('/courses', { :controller => 'courses', :action => 'index' })
  get('/courses/:id', { :controller => 'courses', :action => 'show' })

  # UPDATE
  get('/courses/:id/edit', { :controller => 'courses', :action => 'edit' })
  get('/update_course/:id', { :controller => 'courses', :action => 'update' })

  # DELETE
  get('/delete_course/:id', { :controller => 'courses', :action => 'destroy' })
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
