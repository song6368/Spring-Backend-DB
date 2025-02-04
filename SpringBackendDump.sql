PGDMP  *    9            	    |            postgres    16.4    16.4 Y    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    5    postgres    DATABASE     y   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Korean_Korea.949';
    DROP DATABASE postgres;
                postgres    false            .           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4909                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            /           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1255    16425    reset_user_id_sequence() 	   PROCEDURE     �   CREATE PROCEDURE public.reset_user_id_sequence()
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- 시퀀스를 1로 초기화
    ALTER SEQUENCE users_user_id_seq RESTART WITH 1;
END;
$$;
 0   DROP PROCEDURE public.reset_user_id_sequence();
       public          postgres    false            �            1259    16486    comments    TABLE       CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16485    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    221            0           0    0    comments_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.comment_id;
          public          postgres    false    220            �            1259    16567    follows    TABLE     �   CREATE TABLE public.follows (
    follower_id bigint NOT NULL,
    following_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.follows;
       public         heap    postgres    false            �            1259    16541    likes    TABLE     �   CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint,
    comment_id bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    16540    likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.likes_id_seq;
       public          postgres    false    223            1           0    0    likes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;
          public          postgres    false    222            �            1259    16620    messages    TABLE     �   CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id bigint NOT NULL,
    receiver_id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    16619    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          postgres    false    229            2           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          postgres    false    228            �            1259    16640    notifications    TABLE     
  CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    type character varying(50) NOT NULL,
    entity_id bigint NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    16639    notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    231            3           0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    230            �            1259    16593 	   post_tags    TABLE     [   CREATE TABLE public.post_tags (
    post_id bigint NOT NULL,
    tag_id bigint NOT NULL
);
    DROP TABLE public.post_tags;
       public         heap    postgres    false            �            1259    16654 
   post_views    TABLE     �   CREATE TABLE public.post_views (
    id integer NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint,
    view_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.post_views;
       public         heap    postgres    false            �            1259    16653    post_views_id_seq    SEQUENCE     �   CREATE SEQUENCE public.post_views_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.post_views_id_seq;
       public          postgres    false    233            4           0    0    post_views_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.post_views_id_seq OWNED BY public.post_views.id;
          public          postgres    false    232            �            1259    16428    posts    TABLE     *  CREATE TABLE public.posts (
    post_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16427    posts_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.posts_post_id_seq;
       public          postgres    false    219            5           0    0    posts_post_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts.post_id;
          public          postgres    false    218            �            1259    16584    tags    TABLE     �   CREATE TABLE public.tags (
    tag_id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16583    tags_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tags_tag_id_seq;
       public          postgres    false    226            6           0    0    tags_tag_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tags_tag_id_seq OWNED BY public.tags.tag_id;
          public          postgres    false    225            �            1259    16403    users    TABLE     M  CREATE TABLE public.users (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16402    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    217            7           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    216            M           2604    16489    comments comment_id    DEFAULT     r   ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN comment_id DROP DEFAULT;
       public          postgres    false    220    221    221            P           2604    16544    likes id    DEFAULT     d   ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);
 7   ALTER TABLE public.likes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            U           2604    16623    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            W           2604    16643    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            Z           2604    16657    post_views id    DEFAULT     n   ALTER TABLE ONLY public.post_views ALTER COLUMN id SET DEFAULT nextval('public.post_views_id_seq'::regclass);
 <   ALTER TABLE public.post_views ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            J           2604    16443    posts post_id    DEFAULT     n   ALTER TABLE ONLY public.posts ALTER COLUMN post_id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);
 <   ALTER TABLE public.posts ALTER COLUMN post_id DROP DEFAULT;
       public          postgres    false    218    219    219            S           2604    16587    tags tag_id    DEFAULT     j   ALTER TABLE ONLY public.tags ALTER COLUMN tag_id SET DEFAULT nextval('public.tags_tag_id_seq'::regclass);
 :   ALTER TABLE public.tags ALTER COLUMN tag_id DROP DEFAULT;
       public          postgres    false    225    226    226            G           2604    16413    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    216    217                      0    16486    comments 
   TABLE DATA           a   COPY public.comments (comment_id, post_id, user_id, content, created_at, updated_at) FROM stdin;
    public          postgres    false    221   qi                 0    16567    follows 
   TABLE DATA           H   COPY public.follows (follower_id, following_id, created_at) FROM stdin;
    public          postgres    false    224   �i                 0    16541    likes 
   TABLE DATA           M   COPY public.likes (id, user_id, post_id, comment_id, created_at) FROM stdin;
    public          postgres    false    223   �i       #          0    16620    messages 
   TABLE DATA           S   COPY public.messages (id, sender_id, receiver_id, content, created_at) FROM stdin;
    public          postgres    false    229   �i       %          0    16640    notifications 
   TABLE DATA           Z   COPY public.notifications (id, user_id, type, entity_id, is_read, created_at) FROM stdin;
    public          postgres    false    231   �i       !          0    16593 	   post_tags 
   TABLE DATA           4   COPY public.post_tags (post_id, tag_id) FROM stdin;
    public          postgres    false    227   j       '          0    16654 
   post_views 
   TABLE DATA           E   COPY public.post_views (id, post_id, user_id, view_date) FROM stdin;
    public          postgres    false    233   j                 0    16428    posts 
   TABLE DATA           Y   COPY public.posts (post_id, title, content, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    219   <j                  0    16584    tags 
   TABLE DATA           8   COPY public.tags (tag_id, name, created_at) FROM stdin;
    public          postgres    false    226   �j                 0    16403    users 
   TABLE DATA           [   COPY public.users (user_id, username, email, password, created_at, updated_at) FROM stdin;
    public          postgres    false    217   �j       8           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          postgres    false    220            9           0    0    likes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.likes_id_seq', 1, false);
          public          postgres    false    222            :           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 1, false);
          public          postgres    false    228            ;           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);
          public          postgres    false    230            <           0    0    post_views_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.post_views_id_seq', 1, false);
          public          postgres    false    232            =           0    0    posts_post_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.posts_post_id_seq', 2, true);
          public          postgres    false    218            >           0    0    tags_tag_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tags_tag_id_seq', 1, false);
          public          postgres    false    225            ?           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);
          public          postgres    false    216            c           2606    16495    comments comments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    221            k           2606    16572    follows follows_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (follower_id, following_id);
 >   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_pkey;
       public            postgres    false    224    224            e           2606    16547    likes likes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public            postgres    false    223            g           2606    16551 "   likes likes_user_id_comment_id_key 
   CONSTRAINT     l   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_comment_id_key UNIQUE (user_id, comment_id);
 L   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_comment_id_key;
       public            postgres    false    223    223            i           2606    16549    likes likes_user_id_post_id_key 
   CONSTRAINT     f   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_post_id_key UNIQUE (user_id, post_id);
 I   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_post_id_key;
       public            postgres    false    223    223            s           2606    16628    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    229            u           2606    16647     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    231            q           2606    16597    post_tags post_tags_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (post_id, tag_id);
 B   ALTER TABLE ONLY public.post_tags DROP CONSTRAINT post_tags_pkey;
       public            postgres    false    227    227            w           2606    16660    post_views post_views_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.post_views
    ADD CONSTRAINT post_views_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.post_views DROP CONSTRAINT post_views_pkey;
       public            postgres    false    233            a           2606    16445    posts posts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    219            m           2606    16592    tags tags_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_name_key;
       public            postgres    false    226            o           2606    16590    tags tags_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    226            ]           2606    16412    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    217            _           2606    16415    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            y           2606    16496    comments comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public          postgres    false    219    4705    221            z           2606    16501    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    221    4703    217            ~           2606    16573     follows follows_follower_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_follower_id_fkey;
       public          postgres    false    217    224    4703                       2606    16578 !   follows follows_following_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_following_id_fkey FOREIGN KEY (following_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_following_id_fkey;
       public          postgres    false    217    224    4703            {           2606    16562    likes likes_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comments(comment_id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_comment_id_fkey;
       public          postgres    false    221    4707    223            |           2606    16557    likes likes_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_post_id_fkey;
       public          postgres    false    223    219    4705            }           2606    16552    likes likes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_fkey;
       public          postgres    false    217    4703    223            �           2606    16634 "   messages messages_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_receiver_id_fkey;
       public          postgres    false    217    229    4703            �           2606    16629     messages messages_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_sender_id_fkey;
       public          postgres    false    4703    217    229            �           2606    16648 (   notifications notifications_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_user_id_fkey;
       public          postgres    false    231    217    4703            �           2606    16598     post_tags post_tags_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.post_tags DROP CONSTRAINT post_tags_post_id_fkey;
       public          postgres    false    4705    227    219            �           2606    16603    post_tags post_tags_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.post_tags DROP CONSTRAINT post_tags_tag_id_fkey;
       public          postgres    false    4719    227    226            �           2606    16661 "   post_views post_views_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_views
    ADD CONSTRAINT post_views_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.post_views DROP CONSTRAINT post_views_post_id_fkey;
       public          postgres    false    4705    233    219            �           2606    16666 "   post_views post_views_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_views
    ADD CONSTRAINT post_views_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.post_views DROP CONSTRAINT post_views_user_id_fkey;
       public          postgres    false    4703    233    217            x           2606    16452    posts posts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public          postgres    false    4703    219    217                  x������ � �            x������ � �            x������ � �      #      x������ � �      %      x������ � �      !      x������ � �      '      x������ � �         O   x�3�,I-.Q-HI,I�L��+I̓s8��Ltt�������M�̍Q�̬L,�L��,L�̸b���� V{              x������ � �         �   x�3�LL���C!��Ltt�ͬLM��-��,M�M�Hqs�V$���h(����˩b��bh�����TX���e�Xjii��\�Zl⚡g�f����jZ�g�P��^��፰�d��1�b=3cSsc<R\1z\\\ ��8�     