package database;

import model.*;
import org.jdbi.v3.core.Jdbi;

import java.util.*;

public class DAOMovie {
    public DAOMovie() {

    }

    public static List<AvartarMovie> getFirstAvt(int idMovie) {
        Jdbi me = JDBiConnector.me();
        String query = "SELECT name,id FROM avatars_movie where idMovie=:idMovie LIMIT 1";
        return me.withHandle(handle -> {
            return handle.createQuery(query).bind("idMovie", idMovie).mapToBean(AvartarMovie.class).list();
        });
    }

    public static List<Movie> searchMovie(String name) {
        Jdbi me = JDBiConnector.me();

        String query = "SELECT mv.id, mv.name FROM movies mv where mv.name LIKE :name ORDER BY createAt desc LIMIT 10";
        List<Movie> res = me.withHandle(handle -> {
            return handle.createQuery(query).bind("name", "%" + name + "%")
                    .mapToBean(Movie.class)
                    .list();
        });
        for (Movie mv : res) {
            mv.setAvatars(getFirstAvt(mv.getId()));
        }
        return res;

    }






    public static void main(String[] args) {
        System.out.println(searchMovie("a"));
    }



}
