#include <SFML/Graphics.hpp>

int main()
{
	sf::RenderWindow window(sf::VideoMode(200, 200), "Minimal SFML");
	sf::CircleShape shape(100.0f);
	shape.setFillColor(sf::Color::Green);

	while (window.isOpen())
	{
		window.clear();
		window.draw(shape);
		window.display();

		sf::Event event;
		while (window.waitEvent(event))
		{
			if (event.type == sf::Event::Closed) window.close();
		}
	}

	return 0;
}
