void settings() {
  //fullScreen();
  size(720, 1280);
  noSmooth();
}

void setup() {
  s[0] = new Cannon();
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].health = 100;

  s[0].addFCPattern(new FCPattern() {
    public void fire()
    {
      int num = this.numOfCurBullet;
      Bullet bullet = new ABullet();

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = 0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.cannon.getPosition());
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;
      bullets.add(bullet);
    }

    public void setBulletColor() {
      int numOfCycles = 300;
      super.changeBulletColorHSB(numOfCycles);
    }
  });
  s[0].getFCPattern(0).setOptions(50, 100);

  s[0].mPattern = new MPattern(s[0]) {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      int time = this.getTime();

      super.rotateAround(x, y, radius, time, period, true, phase0);
    }
  };

  //---------------------------------------------------

  s[1] = new Cannon();
  s[1].setPosition(width / 2, height / 2 - 200);

  s[1].addFCPattern(new FCPattern() {
    public void fire()
    {
      int num = this.numOfCurBullet;
      Bullet bullet = new Bullet();

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = -0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.cannon.getPosition());
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;

      bullets.add(bullet);
    }

    public void setBulletColor() {
      int numOfCycles = 300;
      super.changeBulletColorHSB(numOfCycles);
    }
  });
  s[1].getFCPattern(0).setOptions(50, 100);

  s[1].mPattern = new MPattern(s[1]) {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      int time = this.getTime();

      super.rotateAround(x, y, radius, time, period, false, phase0);
    }
  };

  //--------------------------------------------------------

  test = new Cannon();
  test.setPosition(width / 2, 100);
  test.health = 500;

  test.addFCPattern(new FCPattern() {
    public void fire() {
      Bullet bullet = new ABullet();

      PVector startPos = this.cannon.getPosition();
      bullet.setPosition(startPos);
      bullet.setVelocity(super.targetPlayerFrom(startPos));
      bullet.size = 13;
      bullet.speed = 5;
      // bullet.ricochetModule.setOptions(1, true, true, true);

      bullets.add(bullet);
    }

    public void setBulletColor() {
      getCurBullet().setColor(0, 255, 0);
      //bullets[numOfCurBullet].col = color(0, 255, 0);
    }
  });
  test.getFCPattern(0).setOptions(10, 1);

  //--------------------------------------------------------

  player = new Player(width / 2, height - 100, 8);
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");

  rectMode(CENTER);
  textAlign(CENTER);
}
