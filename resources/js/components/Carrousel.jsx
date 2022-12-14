import Carousel from 'react-bootstrap/Carousel';

function Carrousel(){

    return (
        <Carousel interval={2000}>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/RYSgd9L/burguer.png"
                />
                <Carousel.Caption>
                    <h3>Fast food</h3>
                    <p>The best taste of fast food is here!</p>
                </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/CJhwSRf/potato2.jpg"
                />

                <Carousel.Caption>
                    <h3>Snacks</h3>
                    <p>Not only can you find food, but also snacks!</p>
                </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/wsxS99Y/pizza.jpg"
                />

                <Carousel.Caption>
                    <h3>Meals of the day</h3>
                    <p>You can find the breakfast, lunch and dinner in the same place.</p>
                </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/2WQBTmh/salad.jpg"
                />
                <Carousel.Caption>
                    <h3>Vegetarian food</h3>
                    <p>If you prefer to say no to meat, you can find vegetarian foods.</p>
                </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/TRrywk8/boing.jpg"
                />
                <Carousel.Caption>
                    <h3>Drinks</h3>
                    <p>You can find the most popular juices.</p>
                </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/y8wkGr1/soda.webp"
                />
                <Carousel.Caption>
                    <h3>Soda</h3>
                    <p>To enjoy more, we offer you the best sodas.</p>
                </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
                <img className="img-carousel"
                    src="https://i.ibb.co/km7BsQ2/water.jpg"
                />
                <Carousel.Caption>
                    <h3>Water</h3>
                    <p>If you prefer something natural, you can find well-known water brands.</p>
                </Carousel.Caption>
            </Carousel.Item>
        </Carousel>
    );
    
}

export default Carrousel;