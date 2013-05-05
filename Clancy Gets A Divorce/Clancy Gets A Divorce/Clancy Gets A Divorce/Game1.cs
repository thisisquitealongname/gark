using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.GamerServices;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;

namespace Clancy_Gets_A_Divorce
{
    /// <summary>
    /// This is the main type for your game
    /// </summary>
    /// 

    public class Game1 : Microsoft.Xna.Framework.Game
    {
        GraphicsDeviceManager graphics;
        SpriteBatch spriteBatch;

        //txrUgh
        Texture2D txrUgh;
        Vector2 ughPosition = Vector2.Zero;
        Vector2 ughSpeed = new Vector2(0f, 0f);

        Vector2 clancyBatPosition = Vector2.Zero;
        Vector2 clancyBatSpeed = new Vector2(0f, 30f);


        //clancyBat
        private AnimatedTexture txrClancyBat;
        private const float rotation = 0;
        private const float scale = 2.0f;
        private const float depth = 0.5f;

        public Game1()
        {
            graphics = new GraphicsDeviceManager(this);
            graphics.IsFullScreen = false;
            graphics.PreferredBackBufferHeight = 480;
            graphics.PreferredBackBufferWidth = 640;
            Content.RootDirectory = "Content";

            //clancyBat
            
            TargetElapsedTime = TimeSpan.FromSeconds(1 / 15.0);
        }

        /// <summary>
        /// Allows the game to perform any initialization it needs to before starting to run.
        /// This is where it can query for any required services and load any non-graphic
        /// related content.  Calling base.Initialize will enumerate through any components
        /// and initialize them as well.
        /// </summary>
        protected override void Initialize()
        {
            // TODO: Add your initialization logic here

            base.Initialize();
        }

        /// <summary>
        /// LoadContent will be called once per game and is the place to load
        /// all of your content.
        /// </summary>
        /// 



        private Viewport viewport;
        private Vector2 clancyPos;
        private const int Frames = 3;
        private const int FramesPerSec = 2;

        protected override void LoadContent()
        {
            // Create a new SpriteBatch, which can be used to draw textures.
            spriteBatch = new SpriteBatch(GraphicsDevice);
            txrUgh = Content.Load<Texture2D>("imgUgh");

            txrClancyBat = new AnimatedTexture(Vector2.Zero, rotation, scale, depth);
            txrClancyBat.Play();
            txrClancyBat.Load(Content, "imgClancyBat", Frames, FramesPerSec);

            viewport = graphics.GraphicsDevice.Viewport;
            clancyPos = new Vector2(viewport.Width / 2, 0);

            // TODO: use this.Content to load your game content here



        }

        /// <summary>
        /// UnloadContent will be called once per game and is the place to unload
        /// all content.
        /// </summary>
        protected override void UnloadContent()
        {
            // TODO: Unload any non ContentManager content here
        }

        /// <summary>
        /// Allows the game to run logic such as updating the world,
        /// checking for collisions, gathering input, and playing audio.
        /// </summary>
        /// <param name="gameTime">Provides a snapshot of timing values.</param>
        protected override void Update(GameTime gameTime)
        {
            // Allows the game to exit
            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
                this.Exit();
            
            txrClancyBat.UpdateFrame((float)gameTime.TotalGameTime.TotalSeconds);
            

            // TODO: Add your update logic here

            base.Update(gameTime);
        }

        /// <summary>
        /// This is called when the game should draw itself.
        /// </summary>
        /// <param name="gameTime">Provides a snapshot of timing values.</param>
        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);

            // TODO: Add your drawing code here

            spriteBatch.Begin(SpriteSortMode.BackToFront, BlendState.AlphaBlend);
            spriteBatch.Draw(txrUgh, ughPosition, Color.White);
            spriteBatch.End();
            
            spriteBatch.Begin(SpriteSortMode.BackToFront, BlendState.AlphaBlend);
            txrClancyBat.DrawFrame(spriteBatch, clancyPos);
            spriteBatch.End();

            base.Draw(gameTime);
        }
    }
}
public class AnimatedTexture
{

    private int framecount;
    private Texture2D myTexture;
    private float TimePerFrame;
    private int Frame;
    private float TotalElapsed;
    private bool Paused;
    public float Rotation, Scale, Depth;
    public Vector2 Origin;

    public AnimatedTexture(Vector2 Origin, float Rotation, float Scale, float Depth)
    {

        this.Origin = Origin;
        this.Rotation = Rotation;
        this.Scale = Scale;
        this.Depth = Depth;

    }

    public void Load(ContentManager content, string asset, int FrameCount, int FramesPerSec)
    {

        framecount = FrameCount;
        myTexture = content.Load<Texture2D>(asset);
        TimePerFrame = (float)1 / FramesPerSec;
        Frame = 0;
        TotalElapsed = 0;
        Paused = false;

    }

    // class AnimatedTexture
    public void UpdateFrame(float elapsed)
    {

        if (Paused)
        return;

        TotalElapsed += elapsed;

        if (TotalElapsed > TimePerFrame)
        {

            Frame++;

            // Keep the Frame between 0 and the total frames, minus one.
            Frame = Frame % framecount;
            TotalElapsed -= TimePerFrame;

        }

    }

    // class AnimatedTexture
    public void DrawFrame(SpriteBatch Batch, Vector2 screenpos)
    {

        DrawFrame(Batch, Frame, screenpos);

    }

    public void DrawFrame(SpriteBatch Batch, int Frame, Vector2 screenpos)
    {

        int FrameWidth = myTexture.Width / framecount;
        Rectangle sourcerect = new Rectangle(FrameWidth * Frame, 0,
        FrameWidth, myTexture.Height);
        Batch.Draw(myTexture, screenpos, sourcerect, Color.White,
        Rotation, Origin, Scale, SpriteEffects.None, Depth);

    }

    public bool IsPaused
    {

        get { return Paused; }

    }

    public void Reset()
    {

        Frame = 0;
        TotalElapsed = 0f;

    }

    public void Stop()
    {

        Pause();
        Reset();

    }

    public void Play()
    {

        Paused = false;

    }

    public void Pause()
    {

        Paused = true;

    }

}
