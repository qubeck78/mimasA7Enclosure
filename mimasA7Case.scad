$fn = 100;


module base()
{
    cube( [ 120 + 2.4, 91 + 2.4 , 1.2 ] );

    cube( [ 120 + 2.4, 1.2, 25 ] );
    translate( [ 0, 91 + 1.2, 0 ] ) cube( [ 120 + 2.4, 1.2, 25 ] );

    //front
    difference()
    {
        cube( [ 1.2, 91 + 2.4 , 25 ] );
        
        //power socket
        translate( [ -0.1, 19.5, 12 + 6.5 ] ) rotate( [ 0, 90, 0 ] ) cylinder( d = 9, h = 1.4 );
        
        
        //usb
        translate( [ -0.1, 42.5, 12 + 0.5 ] ) cube( [ 1.4, 12, 10 ] );

        //ethernet
        translate( [ -0.1, 61.8, 12 - 0.5 ] ) cube( [ 1.4, 17, 13.51 ] );


    }
    //back
    translate( [ 120 + 2.4, 0, 0 ] ) 
    difference()
    {
        cube( [ 1.2, 91 + 2.4 , 25 ] );

        //hdmi in
        translate( [ -0.1, 65, 12 ] ) cube( [ 1.4, 16, 7 ] );
        //hdmi out
        translate( [ -0.1, 43.5, 12 ] ) cube( [ 1.4, 16, 7 ] );

    }
}

module lid()
{
    color( "#604020" )
    union()
    {
        //base
        difference()
        {
            cube( [ 120 + 2.4 + 1.2, 91 + 2.4 , 1.2 ] ); 
            
            //ethernet
            translate( [ 0, 61.8, -0.1 ] ) cube( [ 24, 17, 1.4 ] ); 
        
           
            //power switch
            translate( [ 0, 31.4, -0.1 ] ) cube( [ 14, 8, 1.4 ] ); 
            
            
            //7segment, switches
            translate( [ 35, 54.5, -0.1 ] ) cube( [ 41, 26, 1.4 ] ); 
            
        }
    
    
    //guides
    
        translate( [ 1.25, 1.25, -1.2 ] ) cube( [ 2, 2, 2 ] );
        translate( [ 120 + 1.6 - 1.25, 1.25, -1.2 ] ) cube( [ 2, 2, 2 ] );
        translate( [ 1.25, 91 + 0.4 - 1.25 , -1.2 ] ) cube( [ 2, 2, 2 ] );
        translate( [ 120 + 1.6 - 1.25, 91 + 0.4 - 1.25 , -1.2 ] ) cube( [ 2, 2, 2 ] );
    }
 }

        
color("gray") translate( [ 0, 0, 12 ] ) import( "mimasa7.stl", convexity=3 );

difference()
{
    translate([ -1.6, -1.6, 0 ] ) 
    {
        
        union()
        {

            base();
            
           translate( [ 0, 0, 35 ] ) lid();
        }
    }
    

//screw holes
    translate( [ 5, 5, -0.1 ] ) cylinder( d = 3.5, h = 30 );
    translate( [ 115, 5, -0.1 ] ) cylinder( d = 3.5, h = 30 );
    translate( [ 5, 85, -0.1 ] ) cylinder( d = 3.5, h = 30 );
    translate( [ 115, 85, -0.1 ] ) cylinder( d = 3.5, h = 30 );
}