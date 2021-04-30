# Gif-Onboarding
A Creative way to onboard users.

![ezgif-6-d37fe91fda19](https://user-images.githubusercontent.com/79437479/116678361-d78ea280-a9c6-11eb-9aa9-e8eaef7f9d04.gif)


An intractive library to onboard your users with gif images. Just add the animation images and you're ready to go!  

## Installation
Manually drag **Source** folder into your project and start your creative onboarding experience. 
## Ho to start? 


#### Step 1 - Start by adding/updating your datasource

![Screenshot 2021-03-20 at 10 42 56 AM](https://user-images.githubusercontent.com/79437479/111859761-27f6f700-8969-11eb-8054-a1d6eebcc721.png)

Create your own datasource by creating an array of animation images. Click on *PaginationPage+DataSource.swift* and create your animation images datasource. We can created three functions to three different pages. You can create as much as you want. 

> Note: Do call forceLoad() on images to load them in memory.

A complete example of updated datasource will look like this

![Screenshot 2021-04-30 at 3 02 31 PM](https://user-images.githubusercontent.com/79437479/116677892-5cc58780-a9c6-11eb-8b1f-6900956fd3bf.png)



#### Step 2 - Initialise your view and add datasource

1. Create a variable in your view controller 
    `private var onboardingView: PaginationView!`
2. Create initialization method and add the view where you wannt to show Onboarding
    ![Screenshot 2021-03-20 at 11 03 04 AM](https://user-images.githubusercontent.com/79437479/111860198-f895b980-896b-11eb-9b02-6159086e7f79.png)
    
3. Create pages for Onboarding and add titles and animation images
   ![Screenshot 2021-04-30 at 3 02 07 PM](https://user-images.githubusercontent.com/79437479/116677646-13753800-a9c6-11eb-9c52-c470c51a4a46.png)

4. Enjoy the show 

  ![Screenshot 2021-03-20 at 11 10 39 AM](https://user-images.githubusercontent.com/79437479/111860339-ea946880-896c-11eb-8f54-a3878b729311.png)
   

> All the examples can be found at **ViewController.swift**
### Pro tip - Handle the complition!
Make the necessary changes or navigate to another view by handling completion handler. This handler will be called when user press the continue button on last screen. 


![Screenshot 2021-03-20 at 11 16 33 AM](https://user-images.githubusercontent.com/79437479/111860479-cd13ce80-896d-11eb-9e8a-a5dbd9c7b899.png)

### Want to hire Experienced Software developers and Solution Architects? 

![Screenshot 2021-02-24 at 11 21 15 AM](https://user-images.githubusercontent.com/79437479/111860578-84104a00-896e-11eb-82ee-587340a78d2f.png)


Must Visit -> [www.ajm.in](http://ajm.in/) 
Get a quote -> [hello@ajm.in](mailto:hello@ajm.in)






